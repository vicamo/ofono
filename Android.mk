# Copyright 2014, You-Sheng Yang
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

OFONO_TOPSRCDIR := $(LOCAL_PATH)
OFONO_VERSION := 1.14
OFONO_CONFIGDIR := /system/etc/ofono
OFONO_PLUGINDIR := /system/lib/ofono/plugins
OFONO_STORAGEDIR := /data/misc/ofono/storage

.PHONY: ofono-executable-targets ofono-library-targets

define ofono-add-to-targets
$(foreach t,$(2),$(eval ofono-$(strip $(t))-targets: $(1)))
endef

.PHONY: all-ofono-targets
all-ofono-targets: ofono-executable-targets ofono-library-targets

ofono_builtin_cflags :=
ofono_builtin_cincludes :=
ofono_builtin_libadd :=
ofono_builtin_modules :=
ofono_builtin_sources :=

################################################
# Builtin Modules:
#
# BOARD_OFONO_HAVE_UDEV
# BOARD_OFONO_HAVE_ISIMODEM
# BOARD_OFONO_HAVE_QMIMODEM
# BOARD_OFONO_HAVE_ATMODEM
# BOARD_OFONO_HAVE_PHONESIM
# BOARD_OFONO_HAVE_CDMAMODEM
# BOARD_OFONO_HAVE_BLUETOOTH
# BOARD_OFONO_USE_BLUEZ4: default true
# BOARD_OFONO_HAVE_PROVISION

ifeq ($(strip $(BOARD_OFONO_HAVE_UDEV)),true)
ofono_builtin_modules += udev
ofono_builtin_sources += \
    plugins/udev.c \
    $(empty)
ofono_builtin_cflags += @UDEV_CFLAGS@
ofono_builtin_libadd += @UDEV_LIBS@

ofono_builtin_modules += udevng
ofono_builtin_sources += \
    plugins/udevng.c \
    $(empty)
endif # UDEV

ifeq ($(strip $(BOARD_OFONO_HAVE_ISIMODEM)),true)
ofono_builtin_cincludes += $(LOCAL_PATH)/gisi
gisi_sources := \
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
    gisi/socket.h \
    $(empty)

ofono_builtin_modules += isimodem
ofono_builtin_sources += \
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
    drivers/isimodem/voicecall.c \
    $(empty)

ofono_builtin_modules += isiusb
ofono_builtin_sources += \
    plugins/isiusb.c \
    $(empty)

ofono_builtin_modules += n900
ofono_builtin_sources += \
    plugins/n900.c \
    plugins/nokia-gpio.c \
    plugins/nokia-gpio.h \
    $(empty)

ofono_builtin_modules += u8500
ofono_builtin_sources += \
    plugins/u8500.c \
    $(empty)
endif # ISIMODEM

ifeq ($(strip $(BOARD_OFONO_HAVE_QMIMODEM)),true)
qmi_sources := \
    drivers/qmimodem/common.h \
    drivers/qmimodem/ctl.h \
    drivers/qmimodem/dms.h \
    drivers/qmimodem/nas.h \
    drivers/qmimodem/pds.h \
    drivers/qmimodem/qmi.c \
    drivers/qmimodem/qmi.h \
    drivers/qmimodem/uim.h \
    drivers/qmimodem/wds.h \
    drivers/qmimodem/wms.h \
    $(empty)

ofono_builtin_modules += qmimodem
ofono_builtin_sources += \
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
    drivers/qmimodem/voicecall.c \
    $(empty)

ofono_builtin_modules += gobi
ofono_builtin_sources += \
    plugins/gobi.c \
    $(empty)
endif # QMIMODEM

ifeq ($(strip $(BOARD_OFONO_HAVE_ATMODEM)),true)
ofono_builtin_cincludes += $(LOCAL_PATH)/gatchat
gatchat_sources := \
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
    gatchat/ringbuffer.h \
    $(empty)

ofono_builtin_modules += atmodem
ofono_builtin_sources += \
    $(gatchat_sources) \
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
    drivers/atmodem/voicecall.c \
    $(empty)

ofono_builtin_modules += nwmodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/nwmodem/nwmodem.c \
    drivers/nwmodem/nwmodem.h \
    drivers/nwmodem/radio-settings.c \
    $(empty)

ofono_builtin_modules += swmodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/swmodem/gprs-context.c \
    drivers/swmodem/swmodem.c \
    drivers/swmodem/swmodem.h \
    $(empty)

ofono_builtin_modules += ztemodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/ztemodem/radio-settings.c \
    drivers/ztemodem/ztemodem.c \
    drivers/ztemodem/ztemodem.h \
    $(empty)

ofono_builtin_modules += iceramodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/iceramodem/gprs-context.c \
    drivers/iceramodem/iceramodem.c \
    drivers/iceramodem/iceramodem.h \
    drivers/iceramodem/radio-settings.c \
    $(empty)

ofono_builtin_modules += huaweimodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/huaweimodem/audio-settings.c \
    drivers/huaweimodem/cdma-netreg.c \
    drivers/huaweimodem/gprs-context.c \
    drivers/huaweimodem/huaweimodem.c \
    drivers/huaweimodem/huaweimodem.h \
    drivers/huaweimodem/radio-settings.c \
    drivers/huaweimodem/ussd.c \
    drivers/huaweimodem/voicecall.c \
    $(empty)

ofono_builtin_modules += calypsomodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/calypsomodem/calypsomodem.c \
    drivers/calypsomodem/calypsomodem.h \
    drivers/calypsomodem/stk.c \
    drivers/calypsomodem/voicecall.c \
    $(empty)

ofono_builtin_modules += mbmmodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/mbmmodem/gprs-context.c \
    drivers/mbmmodem/location-reporting.c \
    drivers/mbmmodem/mbmmodem.c \
    drivers/mbmmodem/mbmmodem.h \
    drivers/mbmmodem/stk.c \
    $(empty)

ofono_builtin_modules += hsomodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/hsomodem/gprs-context.c \
    drivers/hsomodem/hsomodem.c \
    drivers/hsomodem/hsomodem.h \
    drivers/hsomodem/radio-settings.c \
    $(empty)

ofono_builtin_modules += ifxmodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/ifxmodem/audio-settings.c \
    drivers/ifxmodem/ctm.c \
    drivers/ifxmodem/gprs-context.c \
    drivers/ifxmodem/ifxmodem.c \
    drivers/ifxmodem/ifxmodem.h \
    drivers/ifxmodem/radio-settings.c \
    drivers/ifxmodem/stk.c \
    drivers/ifxmodem/voicecall.c \
    $(empty)

ofono_builtin_modules += stemodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/stemodem/caif_rtnl.c \
    drivers/stemodem/caif_rtnl.h \
    drivers/stemodem/caif_socket.h \
    drivers/stemodem/gprs-context.c \
    drivers/stemodem/if_caif.h \
    drivers/stemodem/radio-settings.c \
    drivers/stemodem/stemodem.c \
    drivers/stemodem/stemodem.h \
    drivers/stemodem/voicecall.c \
    $(empty)

ofono_builtin_modules += dunmodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/dunmodem/dunmodem.c \
    drivers/dunmodem/dunmodem.h \
    drivers/dunmodem/gprs.c \
    drivers/dunmodem/network-registration.c \
    $(empty)

ofono_builtin_modules += hfpmodem
ofono_builtin_sources += \
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
    drivers/hfpmodem/voicecall.c \
    $(empty)

ofono_builtin_modules += speedupmodem
ofono_builtin_sources += \
    drivers/atmodem/atutil.h \
    drivers/speedupmodem/speedupmodem.c \
    drivers/speedupmodem/speedupmodem.h \
    drivers/speedupmodem/ussd.c \
    $(empty)

ifeq ($(strip $(BOARD_OFONO_HAVE_PHONESIM)),true)
ofono_builtin_modules += phonesim
ofono_builtin_sources += \
    plugins/phonesim.c \
    $(empty)
endif # PHONESIM

ifeq ($(strip $(BOARD_OFONO_HAVE_CDMAMODEM)),true)
ofono_builtin_modules += cdmamodem
ofono_builtin_sources += \
    drivers/cdmamodem/cdmamodem.c \
    drivers/cdmamodem/cdmamodem.h \
    drivers/cdmamodem/connman.c \
    drivers/cdmamodem/devinfo.c \
    drivers/cdmamodem/voicecall.c \
    $(empty)
endif # CDMAMODEM

ofono_builtin_modules += g1
ofono_builtin_sources += \
    plugins/g1.c \
    $(empty)

ofono_builtin_modules += wavecom
ofono_builtin_sources += \
    plugins/wavecom.c \
    $(empty)

ofono_builtin_modules += calypso
ofono_builtin_sources += \
    plugins/calypso.c \
    $(empty)

ofono_builtin_modules += mbm
ofono_builtin_sources += \
    plugins/mbm.c \
    $(empty)

ofono_builtin_modules += hso
ofono_builtin_sources += \
    plugins/hso.c \
    $(empty)

ofono_builtin_modules += zte
ofono_builtin_sources += \
    plugins/zte.c \
    $(empty)

ofono_builtin_modules += huawei
ofono_builtin_sources += \
    plugins/huawei.c \
    $(empty)

ofono_builtin_modules += sierra
ofono_builtin_sources += \
    plugins/sierra.c \
    $(empty)

ofono_builtin_modules += novatel
ofono_builtin_sources += \
    plugins/novatel.c \
    $(empty)

ofono_builtin_modules += palmpre
ofono_builtin_sources += \
    plugins/palmpre.c \
    $(empty)

ofono_builtin_modules += ifx
ofono_builtin_sources += \
    plugins/ifx.c \
    $(empty)

ofono_builtin_modules += ste
ofono_builtin_sources += \
    plugins/ste.c \
    $(empty)

ofono_builtin_modules += stemgr
ofono_builtin_sources += \
    plugins/stemgr.c \
    $(empty)

ofono_builtin_modules += caif
ofono_builtin_sources += \
    plugins/caif.c \
    $(empty)

ofono_builtin_modules += tc65
ofono_builtin_sources += \
    plugins/tc65.c \
    $(empty)

ofono_builtin_modules += nokia
ofono_builtin_sources += \
    plugins/nokia.c \
    $(empty)

ofono_builtin_modules += nokiacdma
ofono_builtin_sources += \
    plugins/nokiacdma.c \
    $(empty)

ofono_builtin_modules += linktop
ofono_builtin_sources += \
    plugins/linktop.c \
    $(empty)

ofono_builtin_modules += icera
ofono_builtin_sources += \
    plugins/icera.c \
    $(empty)

ofono_builtin_modules += alcatel
ofono_builtin_sources += \
    plugins/alcatel.c \
    $(empty)

ofono_builtin_modules += speedup
ofono_builtin_sources += \
    plugins/speedup.c \
    $(empty)

ofono_builtin_modules += speedupcdma
ofono_builtin_sources += \
    plugins/speedupcdma.c \
    $(empty)

ofono_builtin_modules += samsung
ofono_builtin_sources += \
    plugins/samsung.c \
    $(empty)

ofono_builtin_modules += sim900
ofono_builtin_sources += \
    plugins/sim900.c \
    $(empty)

ofono_builtin_modules += connman
ofono_builtin_sources += \
    plugins/connman.c \
    $(empty)

ofono_builtin_modules += he910
ofono_builtin_sources += \
    plugins/he910.c \
    $(empty)

ifeq ($(strip $(BOARD_OFONO_HAVE_BLUETOOTH)),true)

ifneq ($(strip $(BOARD_HAVE_BLUETOOTH)),true)
$(error BOARD_OFONO_HAVE_BLUETOOTH enabled while BOARD_HAVE_BLUETOOTH is not true)
endif

ifneq ($(strip $(BOARD_OFONO_USE_BLUEZ4)),false)
ofono_builtin_libadd += \
    libbluetooth \
    $(empty)
ofono_builtin_cincludes += \
    $(LOCAL_PATH)/btio \
    external/bluetooth/bluez/lib \
    $(empty)

btio_sources := \
    btio/btio.c \
    btio/btio.h \
    $(empty)

ofono_builtin_modules += bluez4
ofono_builtin_sources += \
    plugins/bluez4.c \
    plugins/bluez4.h \
    $(empty)

ofono_builtin_modules += telit
ofono_builtin_sources += \
    plugins/bluez4.h \
    plugins/telit.c \
    $(empty)

ofono_builtin_modules += sap
ofono_builtin_sources += \
    plugins/bluez4.h \
    plugins/sap.c \
    $(empty)

ofono_builtin_modules += hfp_bluez4
ofono_builtin_sources += \
    plugins/bluez4.h \
    plugins/hfp_hf_bluez4.c \
    $(empty)

ofono_builtin_modules += hfp_ag_bluez4
ofono_builtin_sources += \
    plugins/bluez4.h \
    plugins/hfp_ag_bluez4.c \
    $(empty)

ofono_builtin_modules += dun_gw_bluez4
ofono_builtin_sources += \
    plugins/bluez4.h \
    plugins/dun_gw_bluez4.c \
    $(empty)

ofono_builtin_sources += \
    $(btio_sources) \
    $(empty)
else # !BLUEZ4
ofono_builtin_modules += bluez5
ofono_builtin_sources += \
    plugins/bluez5.c \
    plugins/bluez5.h \
    $(empty)

ofono_builtin_modules += hfp_bluez5
ofono_builtin_sources += \
    plugins/bluez5.h \
    plugins/hfp_hf_bluez5.c \
    $(empty)

ofono_builtin_modules += hfp_ag_bluez5
ofono_builtin_sources += \
    plugins/bluez5.h \
    plugins/hfp_ag_bluez5.c \
    $(empty)

ofono_builtin_modules += dun_gw_bluez5
ofono_builtin_sources += \
    plugins/bluez5.h \
    plugins/dun_gw_bluez5.c \
    $(empty)
endif # !BLUEZ4
endif # BLUETOOTH

endif # ATMODEM

ifeq ($(strip $(BOARD_OFONO_HAVE_PROVISION)),true)
ofono_builtin_sources += \
    plugins/mbpi.c \
    plugins/mbpi.h \
    $(empty)

ofono_builtin_modules += provision
ofono_builtin_sources += \
    plugins/provision.c \
    $(empty)

ofono_builtin_modules += cdma_provision
ofono_builtin_sources += \
    plugins/cdma-provision.c \
    $(empty)
endif # PROVISION

################################################
# libgdbus-ofonod

include $(CLEAR_VARS)
LOCAL_MODULE := libgdbus-ofono
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
    gdbus/client.c \
    gdbus/gdbus.h \
    gdbus/mainloop.c \
    gdbus/object.c \
    gdbus/polkit.c \
    gdbus/watch.c \
    $(empty)
LOCAL_C_INCLUDES := \
    $(call include-path-for, glib) \
    $(call include-path-for, dbus) \
    $(empty)
include $(BUILD_STATIC_LIBRARY)

$(call ofono-add-to-targets,$(LOCAL_MODULE),library)

################################################
# ofonod

include $(CLEAR_VARS)
LOCAL_MODULE := ofonod
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_COPY_HEADERS_TO := ofono
LOCAL_COPY_HEADERS := \
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
    include/voicecall.h \
    $(empty)

# Generated LOCAL_COPY_HEADERS
ofono_built_version_h := $(call local-intermediates-dir)/generated/version.h
LOCAL_COPY_HEADERS += \
    ../../$(ofono_built_version_h) \
    $(empty)

LOCAL_SRC_FILES := \
    $(ofono_builtin_sources) \
    src/audio-settings.c \
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
    src/cdma-voicecall.c \
    src/common.c \
    src/ctm.c \
    src/dbus.c \
    src/emulator.c \
    src/gnss.c \
    src/gnssagent.c \
    src/gprs-provision.c \
    src/gprs.c \
    src/handsfree-audio.c \
    src/handsfree.c \
    src/history.c \
    src/idmap.c \
    src/location-reporting.c \
    src/log.c \
    src/main.c \
    src/manager.c \
    src/message-waiting.c \
    src/message.c \
    src/modem.c \
    src/nettime.c \
    src/network.c \
    src/phonebook.c \
    src/plugin.c \
    src/private-network.c \
    src/radio-settings.c \
    src/sim-auth.c \
    src/sim.c \
    src/simfs.c \
    src/simutil.c \
    src/siri.c \
    src/sms.c \
    src/smsagent.c \
    src/smsutil.c \
    src/stk.c \
    src/stkagent.c \
    src/stkutil.c \
    src/storage.c \
    src/ussd.c \
    src/util.c \
    src/voicecall.c \
    src/watch.c \
    $(empty)

ofono_built_builtin_h := $(call local-intermediates-dir)/builtin.h
LOCAL_GENERATED_SOURCES := \
    $(ofono_built_builtin_h) \
    $(empty)

LOCAL_C_INCLUDES := \
    $(call include-path-for, glib) \
    $(call include-path-for, dbus) \
    $(LOCAL_PATH)/src \
    $(LOCAL_PATH)/gdbus \
    $(ofono_builtin_cincludes) \
    $(empty)

LOCAL_CFLAGS := \
    -DOFONO_PLUGIN_BUILTIN \
    -DPLUGINDIR=\""$(OFONO_PLUGINDIR)"\" \
    $(ofono_builtin_cflags) \
    $(empty)

# Definitions originally in config.h. However, we'll end up including the wrong
# config.h easily because Android includes almost every folder as search path.
LOCAL_CFLAGS += \
    -DCONFIGDIR=\"$(OFONO_CONFIGDIR)\" \
    -DHAVE_DLFCN_H=1 \
    -DHAVE_INTTYPES_H=1 \
    -DHAVE_MEMORY_H=1 \
    -DHAVE_STDINT_H=1 \
    -DHAVE_STDLIB_H=1 \
    -DHAVE_STRINGS_H=1 \
    -DHAVE_STRING_H=1 \
    -DHAVE_SYS_STAT_H=1 \
    -DHAVE_SYS_TYPES_H=1 \
    -DHAVE_UNISTD_H=1 \
    -DSTDC_HEADERS=1 \
    -DSTORAGEDIR=\"$(OFONO_STORAGEDIR)\" \
    -DVERSION=\"$(OFONO_VERSION)\" \
    -Drestrict=/\*\*/ \
    $(empty)

LOCAL_SHARED_LIBRARIES := \
    libdbus \
    libdl \
    libglib \
    $(ofono_builtin_libadd) \
    $(empty)

LOCAL_STATIC_LIBRARIES := \
    libgdbus-ofono \
    $(empty)

include $(BUILD_EXECUTABLE)

rel := $(LOCAL_PATH)/../../

################################################
# version.h

define transform-ofono-built-version-h
@mkdir -p $(dir $@)
@echo "Sed: $@ <= $<"
$(hide) sed $(foreach var,$(PRIVATE_REPLACE_VARS),-e "s/@$(var)@/$(PRIVATE_$(var))/g") $< >$@
endef

$(rel)$(ofono_built_version_h): $(LOCAL_PATH)/include/version.h.in
$(rel)$(ofono_built_version_h): PRIVATE_REPLACE_VARS := VERSION
$(rel)$(ofono_built_version_h): PRIVATE_VERSION := $(OFONO_VERSION)
$(rel)$(ofono_built_version_h):
	$(transform-ofono-built-version-h)

################################################
# builtin.h

define transform-ofono-built-builtin-h
@mkdir -p $(dir $@)
$(hide)$(OFONO_TOPSRCDIR)/src/genbuiltin $(PRIVATE_MODULES) > $@
endef

$(ofono_built_builtin_h): $(LOCAL_PATH)/src/genbuiltin
$(ofono_built_builtin_h): PRIVATE_MODULES := $(ofono_builtin_modules)
$(ofono_built_builtin_h):
	$(transform-ofono-built-builtin-h)

$(call ofono-add-to-targets,$(LOCAL_MODULE),executable)
