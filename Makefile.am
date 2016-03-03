ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
AM_MAKEFLAGS = --no-print-directory

noinst_LTLIBRARIES =

pkginclude_HEADERS = \
  include/audio-settings.h \
  include/call-barring.h \
  include/call-forwarding.h \
  include/call-meter.h \
  include/call-settings.h \
  include/call-volume.h \
  include/cbs.h \
  include/cdma-connman.h \
  include/cdma-netreg.h \
  include/cdma-provision.h \
  include/cdma-sms.h \
  include/cdma-voicecall.h \
  include/ctm.h \
  include/dbus.h \
  include/devinfo.h \
  include/emulator.h \
  include/gnss.h \
  include/gprs-context.h \
  include/gprs-provision.h \
  include/gprs.h \
  include/handsfree-audio.h \
  include/handsfree.h \
  include/history.h \
  include/location-reporting.h \
  include/log.h \
  include/message-waiting.h \
  include/modem.h \
  include/netreg.h \
  include/nettime.h \
  include/phonebook.h \
  include/plugin.h \
  include/private-network.h \
  include/radio-settings.h \
  include/sim-auth.h \
  include/sim.h \
  include/siri.h \
  include/sms.h \
  include/stk.h \
  include/types.h \
  include/ussd.h \
  include/voicecall.h

nodist_pkginclude_HEADERS = \
  include/version.h

local_headers = \
  $(foreach file,$(pkginclude_HEADERS) \
      $(nodist_pkginclude_HEADERS), \
    include/ofono/$(notdir $(file)))

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = ofono.pc


if DATAFILES
dbusconfdir = @DBUS_CONFDIR@

dist_dbusconf_DATA = src/ofono.conf

if SYSTEMD
systemdunitdir = @SYSTEMD_UNITDIR@

systemdunit_DATA = src/ofono.service
endif

confdir = $(sysconfdir)/ofono

dist_conf_DATA =

statedir = $(localstatedir)/lib/ofono

state_DATA =
endif

builtin_modules =
builtin_sources =
builtin_libadd =
builtin_cflags =

noinst_LTLIBRARIES += gdbus/libgdbus-internal.la

gdbus_libgdbus_internal_la_SOURCES = \
  gdbus/client.c \
  gdbus/gdbus.h \
  gdbus/mainloop.c \
  gdbus/object.c \
  gdbus/polkit.c \
  gdbus/watch.c

gatchat_sources = \
  gatchat/crc-ccitt.c \
  gatchat/crc-ccitt.h \
  gatchat/gat.h \
  gatchat/gatchat.c \
  gatchat/gatchat.h \
  gatchat/gathdlc.c \
  gatchat/gathdlc.h \
  gatchat/gatio.c \
  gatchat/gatio.h \
  gatchat/gatmux.c \
  gatchat/gatmux.h \
  gatchat/gatppp.c \
  gatchat/gatppp.h \
  gatchat/gatrawip.c \
  gatchat/gatrawip.h \
  gatchat/gatresult.c \
  gatchat/gatresult.h \
  gatchat/gatserver.c \
  gatchat/gatserver.h \
  gatchat/gatsyntax.c \
  gatchat/gatsyntax.h \
  gatchat/gattty.c \
  gatchat/gattty.h \
  gatchat/gatutil.c \
  gatchat/gatutil.h \
  gatchat/gsm0710.c \
  gatchat/gsm0710.h \
  gatchat/ppp.h \
  gatchat/ppp_auth.c \
  gatchat/ppp_cp.c \
  gatchat/ppp_cp.h \
  gatchat/ppp_ipcp.c \
  gatchat/ppp_ipv6cp.c \
  gatchat/ppp_lcp.c \
  gatchat/ppp_net.c \
  gatchat/ringbuffer.c \
  gatchat/ringbuffer.h

gisi_sources = \
  gisi/client.c \
  gisi/client.h \
  gisi/common.h \
  gisi/iter.c \
  gisi/iter.h \
  gisi/message.c \
  gisi/message.h \
  gisi/modem.c \
  gisi/modem.h \
  gisi/netlink.c \
  gisi/netlink.h \
  gisi/pep.c \
  gisi/pep.h \
  gisi/phonet.h \
  gisi/pipe.c \
  gisi/pipe.h \
  gisi/server.c \
  gisi/server.h \
  gisi/socket.c \
  gisi/socket.h

btio_sources = \
  btio/btio.c \
  btio/btio.h

gril_sources = \
  gril/gfunc.h \
  gril/gril.c \
  gril/gril.h \
  gril/gril.h \
  gril/grilio.c \
  gril/grilio.h \
  gril/grilutil.c \
  gril/grilutil.h \
  gril/parcel.c \
  gril/parcel.h \
  gril/ril_constants.h

if UDEV
builtin_modules += udev
builtin_sources += plugins/udev.c
builtin_cflags += @UDEV_CFLAGS@
builtin_libadd += @UDEV_LIBS@

builtin_modules += udevng
builtin_sources += plugins/udevng.c
endif

if RILMODEM
builtin_sources += $(gril_sources)

builtin_modules += rildev
builtin_sources += plugins/rildev.c

builtin_modules += ril
builtin_sources += \
  plugins/ril.c \
  plugins/ril.h

builtin_modules += infineon
builtin_sources += plugins/infineon.c

builtin_modules += ril_sofia3gr
builtin_sources += plugins/ril_sofia3gr.c

builtin_modules += rilmodem
builtin_sources += \
  drivers/infineonmodem/infineon_constants.h \
  drivers/rilmodem/call-barring.c \
  drivers/rilmodem/call-forwarding.c \
  drivers/rilmodem/call-settings.c \
  drivers/rilmodem/call-volume.c \
  drivers/rilmodem/devinfo.c \
  drivers/rilmodem/gprs-context.c \
  drivers/rilmodem/gprs.c \
  drivers/rilmodem/network-registration.c \
  drivers/rilmodem/radio-settings.c \
  drivers/rilmodem/rilmodem.c \
  drivers/rilmodem/rilmodem.h \
  drivers/rilmodem/rilutil.c \
  drivers/rilmodem/rilutil.h \
  drivers/rilmodem/sim.c \
  drivers/rilmodem/sms.c \
  drivers/rilmodem/ussd.c \
  drivers/rilmodem/vendor.h \
  drivers/rilmodem/voicecall.c \
  drivers/rilmodem/voicecall.h
endif

if ISIMODEM
builtin_modules += isimodem
builtin_sources += \
  $(gisi_sources) \
  drivers/isimodem/audio-settings.c \
  drivers/isimodem/call-barring.c \
  drivers/isimodem/call-forwarding.c \
  drivers/isimodem/call-meter.c \
  drivers/isimodem/call-settings.c \
  drivers/isimodem/call.h \
  drivers/isimodem/cbs.c \
  drivers/isimodem/debug.c \
  drivers/isimodem/debug.h \
  drivers/isimodem/devinfo.c \
  drivers/isimodem/gpds.h \
  drivers/isimodem/gprs-context.c \
  drivers/isimodem/gprs.c \
  drivers/isimodem/gss.h \
  drivers/isimodem/info.h \
  drivers/isimodem/infoserver.c \
  drivers/isimodem/infoserver.h \
  drivers/isimodem/isimodem.c \
  drivers/isimodem/isimodem.h \
  drivers/isimodem/isiutil.h \
  drivers/isimodem/mtc.h \
  drivers/isimodem/network-registration.c \
  drivers/isimodem/network.h \
  drivers/isimodem/phonebook.c \
  drivers/isimodem/radio-settings.c \
  drivers/isimodem/sim.c \
  drivers/isimodem/sim.h \
  drivers/isimodem/sms.c \
  drivers/isimodem/sms.h \
  drivers/isimodem/ss.h \
  drivers/isimodem/uicc-util.c \
  drivers/isimodem/uicc-util.h \
  drivers/isimodem/uicc.c \
  drivers/isimodem/uicc.h \
  drivers/isimodem/ussd.c \
  drivers/isimodem/voicecall.c

builtin_modules += isiusb
builtin_sources += plugins/isiusb.c

builtin_modules += n900
builtin_sources += \
  plugins/n900.c \
  plugins/nokia-gpio.c \
  plugins/nokia-gpio.h

builtin_modules += u8500
builtin_sources += plugins/u8500.c
endif

if QMIMODEM
qmi_sources = \
  drivers/qmimodem/common.h \
  drivers/qmimodem/ctl.h \
  drivers/qmimodem/dms.h \
  drivers/qmimodem/nas.h \
  drivers/qmimodem/pds.h \
  drivers/qmimodem/qmi.c \
  drivers/qmimodem/qmi.h \
  drivers/qmimodem/uim.h \
  drivers/qmimodem/wds.h \
  drivers/qmimodem/wms.h

builtin_modules += qmimodem
builtin_sources += \
  $(qmi_sources) \
  drivers/qmimodem/devinfo.c \
  drivers/qmimodem/gprs-context.c \
  drivers/qmimodem/gprs.c \
  drivers/qmimodem/location-reporting.c \
  drivers/qmimodem/network-registration.c \
  drivers/qmimodem/qmimodem.c \
  drivers/qmimodem/qmimodem.h \
  drivers/qmimodem/radio-settings.c \
  drivers/qmimodem/sim-legacy.c \
  drivers/qmimodem/sim.c \
  drivers/qmimodem/sms.c \
  drivers/qmimodem/ussd.c \
  drivers/qmimodem/util.h \
  drivers/qmimodem/voicecall.c

builtin_modules += gobi
builtin_sources += plugins/gobi.c
endif

if ATMODEM
builtin_modules += atmodem
builtin_sources += \
  drivers/atmodem/atmodem.c \
  drivers/atmodem/atmodem.h \
  drivers/atmodem/atutil.c \
  drivers/atmodem/atutil.h \
  drivers/atmodem/call-barring.c \
  drivers/atmodem/call-forwarding.c \
  drivers/atmodem/call-meter.c \
  drivers/atmodem/call-settings.c \
  drivers/atmodem/call-volume.c \
  drivers/atmodem/cbs.c \
  drivers/atmodem/devinfo.c \
  drivers/atmodem/gnss.c \
  drivers/atmodem/gprs-context.c \
  drivers/atmodem/gprs.c \
  drivers/atmodem/network-registration.c \
  drivers/atmodem/phonebook.c \
  drivers/atmodem/sim-auth.c \
  drivers/atmodem/sim.c \
  drivers/atmodem/sms.c \
  drivers/atmodem/stk.c \
  drivers/atmodem/stk.h \
  drivers/atmodem/ussd.c \
  drivers/atmodem/vendor.h \
  drivers/atmodem/voicecall.c

builtin_modules += nwmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/nwmodem/nwmodem.c \
  drivers/nwmodem/nwmodem.h \
  drivers/nwmodem/radio-settings.c

builtin_modules += swmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/swmodem/gprs-context.c \
  drivers/swmodem/swmodem.c \
  drivers/swmodem/swmodem.h

builtin_modules += ztemodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/ztemodem/radio-settings.c \
  drivers/ztemodem/ztemodem.c \
  drivers/ztemodem/ztemodem.h

builtin_modules += iceramodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/iceramodem/gprs-context.c \
  drivers/iceramodem/iceramodem.c \
  drivers/iceramodem/iceramodem.h \
  drivers/iceramodem/radio-settings.c

builtin_modules += huaweimodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/huaweimodem/audio-settings.c \
  drivers/huaweimodem/cdma-netreg.c \
  drivers/huaweimodem/gprs-context.c \
  drivers/huaweimodem/huaweimodem.c \
  drivers/huaweimodem/huaweimodem.h \
  drivers/huaweimodem/radio-settings.c \
  drivers/huaweimodem/ussd.c \
  drivers/huaweimodem/voicecall.c

builtin_modules += calypsomodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/calypsomodem/calypsomodem.c \
  drivers/calypsomodem/calypsomodem.h \
  drivers/calypsomodem/stk.c \
  drivers/calypsomodem/voicecall.c

builtin_modules += mbmmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/mbmmodem/gprs-context.c \
  drivers/mbmmodem/location-reporting.c \
  drivers/mbmmodem/mbmmodem.c \
  drivers/mbmmodem/mbmmodem.h \
  drivers/mbmmodem/stk.c

builtin_modules += telitmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/telitmodem/location-reporting.c \
  drivers/telitmodem/telitmodem.c \
  drivers/telitmodem/telitmodem.h

builtin_modules += hsomodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/hsomodem/gprs-context.c \
  drivers/hsomodem/hsomodem.c \
  drivers/hsomodem/hsomodem.h \
  drivers/hsomodem/radio-settings.c

builtin_modules += ifxmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/ifxmodem/audio-settings.c \
  drivers/ifxmodem/ctm.c \
  drivers/ifxmodem/gprs-context.c \
  drivers/ifxmodem/ifxmodem.c \
  drivers/ifxmodem/ifxmodem.h \
  drivers/ifxmodem/radio-settings.c \
  drivers/ifxmodem/stk.c \
  drivers/ifxmodem/voicecall.c

builtin_modules += stemodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/stemodem/caif_rtnl.c \
  drivers/stemodem/caif_rtnl.h \
  drivers/stemodem/caif_socket.h \
  drivers/stemodem/gprs-context.c \
  drivers/stemodem/if_caif.h \
  drivers/stemodem/radio-settings.c \
  drivers/stemodem/stemodem.c \
  drivers/stemodem/stemodem.h \
  drivers/stemodem/voicecall.c

builtin_modules += dunmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/dunmodem/dunmodem.c \
  drivers/dunmodem/dunmodem.h \
  drivers/dunmodem/gprs.c \
  drivers/dunmodem/network-registration.c

builtin_modules += hfpmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/hfpmodem/call-volume.c \
  drivers/hfpmodem/devinfo.c \
  drivers/hfpmodem/handsfree.c \
  drivers/hfpmodem/hfpmodem.c \
  drivers/hfpmodem/hfpmodem.h \
  drivers/hfpmodem/network-registration.c \
  drivers/hfpmodem/siri.c \
  drivers/hfpmodem/slc.c \
  drivers/hfpmodem/slc.h \
  drivers/hfpmodem/voicecall.c

builtin_modules += speedupmodem
builtin_sources += \
  drivers/atmodem/atutil.h \
  drivers/speedupmodem/speedupmodem.c \
  drivers/speedupmodem/speedupmodem.h \
  drivers/speedupmodem/ussd.c

if PHONESIM
builtin_modules += phonesim
builtin_sources += plugins/phonesim.c

if DATAFILES
dist_conf_DATA += plugins/phonesim.conf
endif
endif

if CDMAMODEM
builtin_modules += cdmamodem
builtin_sources += \
  drivers/cdmamodem/cdmamodem.c \
  drivers/cdmamodem/cdmamodem.h \
  drivers/cdmamodem/connman.c \
  drivers/cdmamodem/devinfo.c \
  drivers/cdmamodem/voicecall.c
endif

builtin_modules += g1
builtin_sources += plugins/g1.c

builtin_modules += wavecom
builtin_sources += plugins/wavecom.c

builtin_modules += calypso
builtin_sources += plugins/calypso.c

builtin_modules += mbm
builtin_sources += plugins/mbm.c

builtin_modules += hso
builtin_sources += plugins/hso.c

builtin_modules += zte
builtin_sources += plugins/zte.c

builtin_modules += huawei
builtin_sources += plugins/huawei.c

builtin_modules += sierra
builtin_sources += plugins/sierra.c

builtin_modules += novatel
builtin_sources += plugins/novatel.c

builtin_modules += palmpre
builtin_sources += plugins/palmpre.c

builtin_modules += ifx
builtin_sources += plugins/ifx.c

builtin_modules += ste
builtin_sources += plugins/ste.c

builtin_modules += stemgr
builtin_sources += plugins/stemgr.c

builtin_modules += caif
builtin_sources += plugins/caif.c

builtin_modules += cinterion
builtin_sources += plugins/cinterion.c

builtin_modules += nokia
builtin_sources += plugins/nokia.c

builtin_modules += nokiacdma
builtin_sources += plugins/nokiacdma.c

builtin_modules += linktop
builtin_sources += plugins/linktop.c

builtin_modules += icera
builtin_sources += plugins/icera.c

builtin_modules += alcatel
builtin_sources += plugins/alcatel.c

builtin_modules += speedup
builtin_sources += plugins/speedup.c

builtin_modules += speedupcdma
builtin_sources += plugins/speedupcdma.c

builtin_modules += samsung
builtin_sources += plugins/samsung.c

builtin_modules += sim900
builtin_sources += plugins/sim900.c

builtin_modules += connman
builtin_sources += plugins/connman.c

builtin_modules += he910
builtin_sources += plugins/he910.c

builtin_modules += quectel
builtin_sources += plugins/quectel.c

builtin_modules += ublox
builtin_sources += plugins/ublox.c

if BLUETOOTH
if BLUEZ4
builtin_modules += telit
builtin_sources += \
  plugins/telit.c \
  plugins/bluez4.h

builtin_modules += sap
builtin_sources += \
  plugins/bluez4.h \
  plugins/sap.c

builtin_modules += hfp_bluez4
builtin_sources += \
  plugins/bluez4.h \
  plugins/hfp_hf_bluez4.c

builtin_modules += dun_gw_bluez4
builtin_sources += \
  plugins/bluez4.h \
  plugins/dun_gw_bluez4.c
else
builtin_modules += hfp_bluez5
builtin_sources += \
  plugins/bluez5.h \
  plugins/hfp_hf_bluez5.c

builtin_modules += dun_gw_bluez5
builtin_sources += \
  plugins/bluez5.h \
  plugins/dun_gw_bluez5.c
endif
endif
endif

if BLUETOOTH
if BLUEZ4
builtin_modules += bluez4
builtin_sources += \
  plugins/bluez4.c \
  plugins/bluez4.h

builtin_modules += hfp_ag_bluez4
builtin_sources += \
  plugins/bluez4.h \
  plugins/hfp_ag_bluez4.c

builtin_sources += $(btio_sources)
builtin_cflags += @BLUEZ_CFLAGS@
builtin_libadd += @BLUEZ_LIBS@
else
builtin_modules += bluez5
builtin_sources += \
  plugins/bluez5.c \
  plugins/bluez5.h

builtin_modules += hfp_ag_bluez5
builtin_sources += \
  plugins/bluez5.h \
  plugins/hfp_ag_bluez5.c
endif

if UPOWER
builtin_modules += upower
builtin_sources += plugins/upower.c
endif
endif

if PROVISION
builtin_sources += \
  plugins/mbpi.c \
  plugins/mbpi.h

builtin_modules += provision
builtin_sources += plugins/provision.c

builtin_modules += cdma_provision
builtin_sources += plugins/cdma-provision.c
endif

if MAINTAINER_MODE
builtin_modules += example_history
builtin_sources += examples/history.c

builtin_modules += example_nettime
builtin_sources += examples/nettime.c

builtin_modules += example_provision
builtin_sources += examples/provision.c

builtin_modules += example_emulator
builtin_sources += examples/emulator.c

builtin_modules += example_private_network
builtin_sources += examples/private-network.c

builtin_modules += stktest
builtin_sources += plugins/stktest.c

builtin_modules += emulator_fuzz
builtin_sources += plugins/emulator_fuzz.c
endif

builtin_modules += smart_messaging
builtin_sources += plugins/smart-messaging.c

builtin_modules += push_notification
builtin_sources += plugins/push-notification.c

sbin_PROGRAMS = src/ofonod

src_ofonod_SOURCES = \
  $(builtin_sources) \
  $(gatchat_sources) \
  src/audio-settings.c \
  src/bluetooth.h \
  src/call-barring.c \
  src/call-forwarding.c \
  src/call-meter.c \
  src/call-settings.c \
  src/call-volume.c \
  src/cbs.c \
  src/cdma-connman.c \
  src/cdma-netreg.c \
  src/cdma-provision.c \
  src/cdma-sms.c \
  src/cdma-smsutil.c \
  src/cdma-smsutil.h \
  src/cdma-voicecall.c \
  src/common.c \
  src/common.h \
  src/ctm.c \
  src/dbus.c \
  src/emulator.c \
  src/gnss.c \
  src/gnssagent.c \
  src/gnssagent.h \
  src/gprs-provision.c \
  src/gprs.c \
  src/handsfree-audio.c \
  src/handsfree.c \
  src/hfp.h \
  src/history.c \
  src/idmap.c \
  src/idmap.h \
  src/location-reporting.c \
  src/log.c \
  src/main.c \
  src/manager.c \
  src/message-waiting.c \
  src/message.c \
  src/message.h \
  src/modem.c \
  src/nettime.c \
  src/network.c \
  src/ofono.h \
  src/ofono.ver \
  src/phonebook.c \
  src/plugin.c \
  src/private-network.c \
  src/radio-settings.c \
  src/sim-auth.c \
  src/sim.c \
  src/simfs.c \
  src/simfs.h \
  src/simutil.c \
  src/simutil.h \
  src/siri.c \
  src/sms.c \
  src/smsagent.c \
  src/smsagent.h \
  src/smsutil.c \
  src/smsutil.h \
  src/stk.c \
  src/stkagent.c \
  src/stkagent.h \
  src/stkutil.c \
  src/stkutil.h \
  src/storage.c \
  src/storage.h \
  src/ussd.c \
  src/util.c \
  src/util.h \
  src/voicecall.c \
  src/watch.c

src_ofonod_LDADD = \
  gdbus/libgdbus-internal.la \
  $(builtin_libadd) \
  @GLIB_LIBS@ \
  @DBUS_LIBS@ \
  -ldl

src_ofonod_LDFLAGS = \
  -Wl,--export-dynamic \
  -Wl,--version-script=$(srcdir)/src/ofono.ver

BUILT_SOURCES = \
  $(local_headers) \
  src/builtin.h

CLEANFILES = \
  $(BUILT_SOURCES) \
  $(rules_DATA)

plugindir = $(pkglibdir)/plugins

if MAINTAINER_MODE
build_plugindir = $(abs_top_srcdir)/plugins/.libs
else
build_plugindir = $(plugindir)
endif

AM_CFLAGS = \
  @DBUS_CFLAGS@ \
  @GLIB_CFLAGS@ \
  $(builtin_cflags) \
  -DOFONO_PLUGIN_BUILTIN \
  -DPLUGINDIR=\""$(build_plugindir)"\"

AM_CPPFLAGS = \
  -I$(builddir)/include \
  -I$(builddir)/src \
  -I$(srcdir)/src \
  -I$(srcdir)/gdbus \
  -I$(srcdir)/gisi \
  -I$(srcdir)/gatchat \
  -I$(srcdir)/btio \
  -I$(srcdir)/gril

doc_files = \
  doc/audio-settings-api.txt \
  doc/call-barring-api.txt \
  doc/call-forwarding-api.txt \
  doc/call-meter-api.txt \
  doc/call-settings-api.txt \
  doc/call-volume-api.txt \
  doc/calypso-modem.txt \
  doc/cell-broadcast-api.txt \
  doc/certification.txt \
  doc/connman-api.txt \
  doc/features.txt \
  doc/location-reporting-api.txt \
  doc/manager-api.txt \
  doc/message-api.txt \
  doc/message-waiting-api.txt \
  doc/messagemanager-api.txt \
  doc/modem-api.txt \
  doc/network-api.txt \
  doc/ofono-paper.txt \
  doc/overview.txt \
  doc/phonebook-api.txt \
  doc/pushnotification-api.txt \
  doc/radio-settings-api.txt \
  doc/release-faq.txt \
  doc/sim-api.txt \
  doc/siri-api.txt \
  doc/smartmessaging-api.txt \
  doc/stk-api.txt \
  doc/supplementaryservices-api.txt \
  doc/telit-modem.txt \
  doc/text-telephony-api.txt \
  doc/voicecall-api.txt \
  doc/voicecallmanager-api.txt


test_scripts = \
  test/activate-context \
  test/answer-calls \
  test/backtrace \
  test/cancel-ussd \
  test/cdma-connman-disable \
  test/cdma-connman-enable \
  test/cdma-dial-number \
  test/cdma-hangup \
  test/cdma-list-call \
  test/cdma-set-credentials \
  test/change-pin \
  test/create-internet-context \
  test/create-mms-context \
  test/create-multiparty \
  test/deactivate-all \
  test/deactivate-context \
  test/dial-number \
  test/disable-call-forwarding \
  test/disable-gprs \
  test/disable-modem \
  test/display-icon \
  test/enable-cbs \
  test/enable-gprs \
  test/enable-modem \
  test/enter-pin \
  test/get-icon \
  test/get-operators\
  test/get-tech-preference \
  test/hangup-active \
  test/hangup-all \
  test/hangup-call \
  test/hangup-multiparty \
  test/hold-and-answer \
  test/initiate-ussd \
  test/list-calls \
  test/list-contexts \
  test/list-messages \
  test/list-modems \
  test/list-operators \
  test/lock-pin \
  test/lockdown-modem \
  test/monitor-ofono \
  test/offline-modem \
  test/online-modem \
  test/private-chat \
  test/process-context-settings \
  test/receive-sms \
  test/register-auto \
  test/register-operator \
  test/reject-calls \
  test/release-and-answer \
  test/release-and-swap \
  test/remove-contexts \
  test/reset-pin \
  test/scan-for-operators \
  test/send-sms \
  test/send-ussd \
  test/send-vcal \
  test/send-vcard \
  test/set-call-forwarding \
  test/set-cbs-topics \
  test/set-context-property \
  test/set-ddr \
  test/set-fast-dormancy \
  test/set-gsm-band \
  test/set-mic-volume \
  test/set-mms-details \
  test/set-msisdn \
  test/set-roaming-allowed \
  test/set-speaker-volume \
  test/set-tech-preference \
  test/set-tty \
  test/set-umts-band \
  test/set-use-sms-reports \
  test/swap-calls \
  test/test-advice-of-charge \
  test/test-call-barring \
  test/test-call-forwarding \
  test/test-call-settings \
  test/test-cbs \
  test/test-gnss \
  test/test-message-waiting \
  test/test-modem \
  test/test-network-registration \
  test/test-phonebook \
  test/test-push-notification \
  test/test-smart-messaging \
  test/test-sms \
  test/test-ss \
  test/test-ss-control-cb \
  test/test-ss-control-cf \
  test/test-ss-control-cs \
  test/test-stk-menu \
  test/unlock-pin

if TEST
testdir = $(pkglibdir)/test
test_SCRIPTS = $(test_scripts)
endif

EXTRA_DIST = \
  $(doc_files) \
  $(test_scripts) \
  plugins/ofono-speedup.rules \
  plugins/ofono.rules \
  src/genbuiltin

dist_man_MANS = doc/ofonod.8


unit_objects =

unit_tests = \
  unit/test-cdmasms \
  unit/test-common \
  unit/test-idmap \
  unit/test-rilmodem-cs \
  unit/test-rilmodem-sms \
  unit/test-rilmodem-cb \
  unit/test-simutil \
  unit/test-sms \
  unit/test-stkutil \
  unit/test-util

noinst_PROGRAMS = \
  $(unit_tests) \
  unit/test-caif \
  unit/test-mux \
  unit/test-sms-root

unit_test_common_SOURCES = \
  src/common.c \
  src/util.c \
  unit/test-common.c
unit_test_common_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_common_OBJECTS)

unit_test_util_SOURCES = \
  src/util.c \
  unit/test-util.c
unit_test_util_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_utils_OBJECTS)

unit_test_idmap_SOURCES = \
  src/idmap.c \
  unit/test-idmap.c
unit_test_idmap_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_idmap_OBJECTS)

unit_test_simutil_SOURCES = \
  src/simutil.c \
  src/smsutil.c \
  src/storage.c \
  src/util.c \
  unit/test-simutil.c
unit_test_simutil_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_simutil_OBJECTS)

unit_test_stkutil_SOURCES = \
  src/simutil.c \
  src/smsutil.c \
  src/stkutil.c \
  src/storage.c \
  src/util.c \
  unit/stk-test-data.h \
  unit/test-stkutil.c
unit_test_stkutil_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_stkutil_OBJECTS)

unit_test_sms_SOURCES = \
  src/smsutil.c \
  src/storage.c \
  src/util.c \
  unit/test-sms.c
unit_test_sms_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_sms_OBJECTS)

unit_test_cdmasms_SOURCES = \
  src/cdma-smsutil.c \
  unit/test-cdmasms.c
unit_test_cdmasms_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_cdmasms_OBJECTS)

unit_test_sms_root_SOURCES = \
  src/smsutil.c \
  src/storage.c \
  src/util.c \
  unit/test-sms-root.c
unit_test_sms_root_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_sms_root_OBJECTS)

unit_test_mux_SOURCES = \
  $(gatchat_sources) \
  unit/test-mux.c
unit_test_mux_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_mux_OBJECTS)

unit_test_caif_SOURCES = \
  $(gatchat_sources) \
  drivers/stemodem/caif_socket.h \
  drivers/stemodem/if_caif.h \
  unit/test-caif.c
unit_test_caif_LDADD = @GLIB_LIBS@
unit_objects += $(unit_test_caif_OBJECTS)

test_rilmodem_sources = \
  $(gril_sources) \
  gatchat/ringbuffer.c \
  gatchat/ringbuffer.h \
  src/common.c \
  src/log.c \
  src/simutil.c \
  src/util.c \
  unit/rilmodem-test-server.c \
  unit/rilmodem-test-server.h

unit_test_rilmodem_cs_SOURCES = \
  $(test_rilmodem_sources) \
  drivers/rilmodem/call-settings.c \
  unit/test-rilmodem-cs.c
unit_test_rilmodem_cs_LDADD = \
  $(builtin_libadd) \
  -ldl \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la
unit_objects += $(unit_test_rilmodem_cs_OBJECTS)

unit_test_rilmodem_sms_SOURCES = \
  $(test_rilmodem_sources) \
  drivers/rilmodem/sms.c \
  unit/test-rilmodem-sms.c
unit_test_rilmodem_sms_LDADD = \
  $(builtin_libadd) \
  -ldl \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la
unit_objects += $(unit_test_rilmodem_sms_OBJECTS)

unit_test_rilmodem_cb_SOURCES = \
  $(test_rilmodem_sources) \
  drivers/rilmodem/call-barring.c \
  unit/test-rilmodem-cb.c
unit_test_rilmodem_cb_LDADD = \
  $(builtin_libadd) \
  -ldl \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la
unit_objects += $(unit_test_rilmodem_cb_OBJECTS)

TESTS = $(unit_tests)

if TOOLS
noinst_PROGRAMS += \
  tools/auto-enable \
  tools/get-location \
  tools/huawei-audio \
  tools/lookup-apn \
  tools/lookup-provider-name \
  tools/tty-redirector

tools_huawei_audio_SOURCES = tools/huawei-audio.c
tools_huawei_audio_LDADD = \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la

tools_auto_enable_SOURCES = tools/auto-enable.c
tools_auto_enable_LDADD = \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la

tools_get_location_SOURCES = tools/get-location.c
tools_get_location_LDADD = \
  @DBUS_LIBS@ \
  @GLIB_LIBS@

tools_lookup_apn_SOURCES = \
  plugins/mbpi.c \
  plugins/mbpi.h \
  tools/lookup-apn.c
tools_lookup_apn_LDADD = @GLIB_LIBS@

tools_lookup_provider_name_SOURCES = \
  plugins/mbpi.c \
  plugins/mbpi.h \
  tools/lookup-provider-name.c
tools_lookup_provider_name_LDADD = @GLIB_LIBS@

tools_tty_redirector_SOURCES = tools/tty-redirector.c
tools_tty_redirector_LDADD = @GLIB_LIBS@

if QMIMODEM
noinst_PROGRAMS += tools/qmi

tools_qmi_SOURCES = \
  $(qmi_sources) \
  tools/qmi.c
tools_qmi_LDADD = @GLIB_LIBS@
endif

if MAINTAINER_MODE
noinst_PROGRAMS += tools/stktest

tools_stktest_SOURCES = \
  $(gatchat_sources) \
  tools/stktest.c \
  unit/stk-test-data.h
tools_stktest_LDADD = \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la
endif
endif

if BLUETOOTH
if DUNDEE
sbin_PROGRAMS += dundee/dundee

dundee_common_sources = \
  $(gatchat_sources) \
  dundee/dbus.c \
  dundee/device.c \
  dundee/dundee.h \
  dundee/main.c \
  dundee/manager.c \
  src/dbus.c \
  src/log.c

dundee_dundee_LDADD = \
  $(builtin_libadd) \
  -ldl \
  @DBUS_LIBS@ \
  @GLIB_LIBS@ \
  gdbus/libgdbus-internal.la

if DATAFILES
dist_dbusconf_DATA += dundee/dundee.conf

if SYSTEMD
systemdunit_DATA += dundee/dundee.service
endif
endif

if BLUEZ4
dundee_dundee_SOURCES = \
  $(btio_sources) \
  $(dundee_common_sources) \
  dundee/bluez4.c \
  plugins/bluez4.c
else
dundee_dundee_SOURCES = \
  $(dundee_common_sources) \
  dundee/bluez5.c \
  plugins/bluez5.c
endif
endif
endif

noinst_PROGRAMS += \
  gatchat/gsmdial \
  gatchat/test-qcdm \
  gatchat/test-server

gatchat_gsmdial_SOURCES = \
  $(gatchat_sources) \
  gatchat/gsmdial.c
gatchat_gsmdial_LDADD = @GLIB_LIBS@

gatchat_test_server_SOURCES = \
  $(gatchat_sources) \
  gatchat/test-server.c
gatchat_test_server_LDADD = \
  @GLIB_LIBS@ \
  -lutil

gatchat_test_qcdm_SOURCES = \
  $(gatchat_sources) \
  gatchat/test-qcdm.c
gatchat_test_qcdm_LDADD = @GLIB_LIBS@


DISTCHECK_CONFIGURE_FLAGS = \
  --disable-datafiles \
  --enable-dundee \
  --enable-tools

MAINTAINERCLEANFILES = \
  Makefile.in \
  aclocal.m4 \
  compile \
  config.guess \
  config.h.in \
  config.sub \
  configure \
  depcomp \
  install-sh \
  ltmain.sh \
  missing \
  mkinstalldirs


src/builtin.h: src/genbuiltin config.status
	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@

plugins/%.rules:
	$(AM_V_GEN)cp $(srcdir)/$(subst 97-,,$@) $@

include/ofono/version.h: include/version.h
	$(AM_V_at)$(MKDIR_P) include/ofono
	$(AM_V_GEN)$(LN_S) $(abs_top_builddir)/$< $@

include/ofono/%.h: $(abs_top_srcdir)/include/%.h
	$(AM_V_at)$(MKDIR_P) include/ofono
	$(AM_V_GEN)$(LN_S) $< $@

clean-local:
	@$(RM) -rf include/ofono
