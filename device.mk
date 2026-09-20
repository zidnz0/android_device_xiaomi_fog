#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# APEX's
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

TARGET_BOARD_PLATFORM := bengal

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# API Level
PRODUCT_SHIPPING_API_LEVEL := 30

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_PRODUCT_PROPERTIES += \
    vendor.audio.feature.dynamic_ecns.enable=false \
    vendor.audio.offload.buffer.size.kb=256

PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.vc_call_vol_steps=11

PRODUCT_VENDOR_PROPERTIES += \
    ro.audio.monitorRotation=true \
    ro.vendor.audio.misound.bluetooth.enable=true \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.soundfx.usb=true

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.soundtrigger.appdefine.cnn.level=31 \
    ro.vendor.audio.soundtrigger.appdefine.gmm.level=55 \
    ro.vendor.audio.soundtrigger.appdefine.gmm.user.level=50 \
    ro.vendor.audio.soundtrigger.appdefine.vop.level=10 \
    ro.vendor.audio.soundtrigger.lowpower=true \
    ro.vendor.audio.soundtrigger.training.level=50 \
    ro.vendor.audio.soundtrigger.xanzn.cnn.level=70 \
    ro.vendor.audio.soundtrigger.xanzn.gmm.level=45 \
    ro.vendor.audio.soundtrigger.xanzn.gmm.user.level=30 \
    ro.vendor.audio.soundtrigger.xanzn.vop.level=10 \
    ro.vendor.audio.soundtrigger.xatx.cnn.level=27 \
    ro.vendor.audio.soundtrigger.xatx.gmm.level=50 \
    ro.vendor.audio.soundtrigger.xatx.gmm.user.level=40 \
    ro.vendor.audio.soundtrigger.xatx.vop.level=10 \
    ro.vendor.audio.soundtrigger=sva

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.hardware.power.idle_cur_ma=7 \
    bluetooth.hardware.power.operating_voltage_mv=3700 \
    bluetooth.hardware.power.rx_cur_ma=75 \
    bluetooth.hardware.power.tx_cur_ma=93

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.bluetooth.modem_nv_support=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aac-aptx-aptxhd-ldac-aptxadaptive \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false

# Boot animation
TARGET_SCREEN_HEIGHT := 1650
TARGET_SCREEN_WIDTH := 720

# Bootcontrol
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libpiex_shim \
    libstdc++_vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt

PRODUCT_SYSTEM_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.android.camera,com.google.camera

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.perflock.enable=0

# Cgroup and task_profiles
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.quick.charge=1 \
    ro.charger.disable_init_blank=true \
    ro.charger.enable_suspend=true

# Configs File System
PRODUCT_PACKAGES += \
    fs_config_files

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.allow_encrypt_override=true \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.method=dm-default-key

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.qti.display_boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.display_boot.sh \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.layer_caching_active_layer_timeout_ms=1000 \
    debug.hwui.skia_atrace_enabled=false \
    debug.sf.disable_backpressure=1 \
    debug.sf.enable_gl_backpressure=0 \
    debug.sf.enable_egl_image_tracker=0 \
    debug.sf.enable_transaction_tracing=false \
    ro.vendor.display.sensortype=2 \
    ro.vendor.display.svi=1 \
    vendor.display.idle_time=0 \
    vendor.display.idle_time_inactive=0 \
    vendor.display.qdcm.mode_combine=2 \
    vendor.display.svi.config=1 \
    vendor.display.svi.config_path=/vendor/etc/SVIConfig.xml

# DPM
PRODUCT_SYSTEM_PROPERTIES += \
    persist.dpm.feature=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# DPM
PRODUCT_SYSTEM_PROPERTIES += \
    persist.dpm.feature=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpmhalservice.enable=1

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_SYSTEM_PROPERTIES += \
    sys.fp.miui.token=0

# FUSE Passthrough
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GrapheneCamera
ifeq ($(USE_GRAPHENE_CAMERA), true)
PRODUCT_PACKAGES += \
    GrapheneCamera
endif

# Graphics
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IRQ balance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-silead.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-silead.kl

# Kernel
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# LMK
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.lmk.force_inkernel_lmk=true

# Logs
PRODUCT_SYSTEM_PROPERTIES += \
    persist.log.tag.TrafficStats=S

# Media
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    media.aac_51_output_enabled=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true

# Netflix
PRODUCT_SYSTEM_PROPERTIES += \
    ro.netflix.bsp_rev=Q6115-31409-1 \
    ro.netflix.channel=004ee050-1a17-11e9-bb61-6f1da27fb55b \
    ro.netflix.signup=1

# Netmgr
PRODUCT_SYSTEM_PROPERTIES += \
    persist.data.netmgrd.qos.enable=true

# Network
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/com.nxp.mifare.xml

PRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.nfc_nci=pn8x
    ro.vendor.se.type=HCE,UICC

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigFog \
    DialerFog \
    FrameworksFog \
    FrameworksFogAOSPA \
    FrameworksFogIN2 \
    NoCutoutOverlay \
    SettingsFog \
    SettingsProviderFog \
    SettingsProviderFogCommon \
    SettingsProviderFogIN \
    SettingsProviderFogIN2 \
    SettingsProviderRain \
    SettingsProviderWind \
    SystemUIFog \
    TelephonyFog \
    WifiFog

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Phantom Process Monitoring
PRODUCT_PRODUCT_PROPERTIES += \
    sys.fflag.override.settings_enable_monitor_phantom_procs=false

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml

# PI Hooks
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks.disable.gms_key_attestation_block=true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2.vendor \
    android.hardware.power-service-qti

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libprotobuf-cpp-full-3.9.1-vendorcompat

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    media \
    overlay \
    perf \
    telephony \
    vibrator \
    wfd \
    wlan

# Radio
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.telephony.block_binder_thread_on_incoming_calls=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.fetchqos=true \

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.enable_temp_dds=true \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.process_sups_ind=1 \
    persist.vendor.radio.report_codec=1 \
    persist.vendor.radio.snapshot_enabled=1 \
    persist.vendor.radio.snapshot_timer=5 \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ro.vendor.radio.features_common=3 \
    ro.vendor.se.type=HCE,UICC \
    sys.vendor.shutdown.waittime=500

# Remove packages
PRODUCT_PACKAGES += \
    RemovePackages

# RMNet Data
PRODUCT_SYSTEM_PROPERTIES += \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.dl_mode=5 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.mux_count=8 \
    persist.data.df.ul_mode=5 \
    persist.data.wda.enable=true \
    persist.rmnet.data.enable=true

# Rootdir
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom_ramdisk \
    fstab.zram \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.1-service.multihal \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensors.debug.ssc_qmi_debug=true \
    persist.vendor.sensors.enable.bypass_worker=true \
    persist.vendor.sensors.enable.rt_task=false \
    persist.vendor.sensors.hal_trigger_ssr=false \
    persist.vendor.sensors.support_direct_channel=false

# SoC
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=QTI \
    ro.soc.model=SM6225

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi \
    vendor/qcom/opensource/usb/etc

# Thermal
PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# Time-services
PRODUCT_SYSTEM_PROPERTIES += \
    persist.timed.enable=true

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

PRODUCT_PACKAGES += \
    init.qcom.usb.rc \
    init.qcom.usb.sh

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

PRODUCT_VENDOR_PROPERTIES += \
    vendor.usb.diag.func.name=diag \
    vendor.usb.dpl.inst.name=dpl \
    vendor.usb.qdss.inst.name=qdss \
    vendor.usb.rmnet.func.name=gsi \
    vendor.usb.rmnet.inst.name=rmnet \
    vendor.usb.rndis.func.name=gsi \
    vendor.usb.use_ffs_mtp=0 \
    vendor.usb.use_gadget_hal=0

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.usb.config=mtp,adb
endif

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# WLAN
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.wlan.dbs=0

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_VENDOR_PROPERTIES += \
    wifi.aware.interface=wifi-aware0

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor

# Zygote
PRODUCT_SYSTEM_PROPERTIES += \
    zygote.critical_window.minute=10 \
    persist.device_config.runtime_native.usap_pool_enabled=true

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/fog/fog-vendor.mk)
