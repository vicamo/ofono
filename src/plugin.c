/*
 *
 *  oFono - Open Source Telephony
 *
 *  Copyright (C) 2008-2011  Intel Corporation. All rights reserved.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <glib.h>
#include <gmodule.h>

#include "ofono.h"

static GSList *plugins = NULL;

struct ofono_plugin {
	GModule *module;
	gboolean active;
	struct ofono_plugin_desc *desc;
};

static gint compare_priority(gconstpointer a, gconstpointer b)
{
	const struct ofono_plugin *plugin1 = a;
	const struct ofono_plugin *plugin2 = b;

	return plugin2->desc->priority - plugin1->desc->priority;
}

static gboolean add_plugin(GModule *module, struct ofono_plugin_desc *desc)
{
	struct ofono_plugin *plugin;

	if (desc->init == NULL)
		return FALSE;

	if (g_str_equal(desc->version, OFONO_VERSION) == FALSE) {
		ofono_error("Invalid version %s for %s", desc->version,
							desc->description);
		return FALSE;
	}

	plugin = g_try_new0(struct ofono_plugin, 1);
	if (plugin == NULL)
		return FALSE;

	plugin->module = module;
	plugin->active = FALSE;
	plugin->desc = desc;

	__ofono_log_enable(desc->debug_start, desc->debug_stop);

	plugins = g_slist_insert_sorted(plugins, plugin, compare_priority);

	return TRUE;
}

static gboolean check_plugin(struct ofono_plugin_desc *desc,
				char **patterns, char **excludes)
{
	if (excludes) {
		for (; *excludes; excludes++)
			if (g_pattern_match_simple(*excludes, desc->name))
				break;
		if (*excludes) {
			ofono_info("Excluding %s", desc->description);
			return FALSE;
		}
	}

	if (patterns) {
		for (; *patterns; patterns++)
			if (g_pattern_match_simple(*patterns, desc->name))
				break;
		if (*patterns == NULL) {
			ofono_info("Ignoring %s", desc->description);
			return FALSE;
		}
	}

	return TRUE;
}

#include "builtin.h"

int __ofono_plugin_init(const char *pattern, const char *exclude)
{
	gchar **patterns = NULL;
	gchar **excludes = NULL;
	GSList *list;
	GDir *dir;
	const gchar *file;
	gchar *filename;
	unsigned int i;

	DBG("");

	if (pattern)
		patterns = g_strsplit_set(pattern, ":, ", -1);

	if (exclude)
		excludes = g_strsplit_set(exclude, ":, ", -1);

	for (i = 0; __ofono_builtin[i]; i++) {
		if (check_plugin(__ofono_builtin[i],
					patterns, excludes) == FALSE)
			continue;

		add_plugin(NULL, __ofono_builtin[i]);
	}

	dir = g_dir_open(PLUGINDIR, 0, NULL);
	if (dir != NULL) {
		while ((file = g_dir_read_name(dir)) != NULL) {
			GModule *module;
			struct ofono_plugin_desc *desc;

			if (g_str_has_prefix(file, "lib") == TRUE ||
					g_str_has_suffix(file,
						G_MODULE_SUFFIX) == FALSE)
				continue;

			filename = g_build_filename(PLUGINDIR, file, NULL);

			module = g_module_open(filename, 0);
			if (module == NULL) {
				ofono_error("Can't load %s: %s",
						filename, g_module_error());
				g_free(filename);
				continue;
			}

			g_free(filename);

			if (g_module_symbol(module, "ofono_plugin_desc",
						(gpointer *) &desc) == FALSE) {
				ofono_error("Can't load symbol: %s",
							g_module_error());
				g_module_close(module);
				continue;
			}

			if (check_plugin(desc, patterns, excludes) == FALSE) {
				g_module_close(module);
				continue;
			}

			if (add_plugin(module, desc) == FALSE)
				g_module_close(module);
		}

		g_dir_close(dir);
	}

	for (list = plugins; list; list = list->next) {
		struct ofono_plugin *plugin = list->data;

		if (plugin->desc->init() < 0)
			continue;

		plugin->active = TRUE;
	}

	g_strfreev(patterns);
	g_strfreev(excludes);

	return 0;
}

void __ofono_plugin_cleanup(void)
{
	GSList *list;

	DBG("");

	for (list = plugins; list; list = list->next) {
		struct ofono_plugin *plugin = list->data;

		if (plugin->active == TRUE && plugin->desc->exit)
			plugin->desc->exit();

		if (plugin->module)
			g_module_close(plugin->module);

		g_free(plugin);
	}

	g_slist_free(plugins);
}
