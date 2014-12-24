
MAINTAINERCLEANFILES =

if ENABLE_GTK_DOC

DOC_MODULE = ofono

DOC_MAIN_SGML_FILE = $(top_srcdir)/doc/$(DOC_MODULE)-docs.xml

DOC_SOURCE_DIR = \
	$(top_srcdir)/src

include gtk-doc.make

TESTS_ENVIRONMENT = \
	DOC_MODULE=$(DOC_MODULE) \
	DOC_MAIN_SGML_FILE=$(DOC_MAIN_SGML_FILE) \
	SRCDIR=$(abs_srcdir) \
	BUILDDIR=$(abs_builddir)

TESTS = $(GTKDOC_CHECK)

MAINTAINERCLEANFILES += \
	gtk-doc.make \
	version.xml

endif
