# Vendor configuration
$(call inherit-product-if-exists, vendor/qbox/targa_utab_7_6/targa_utab_7_6-vendor.mk)

# Local configuration
$(call inherit-product-if-exists, device/qbox/targa_utab_7_6/local/local.mk)

DEVICE_PACKAGE_OVERLAYS += device/qbox/targa_utab_7_6/overlay

LOCAL_PATH := device/qbox/targa_utab_7_6
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m805_892x
PRODUCT_DEVICE := m805_892x

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.allow.mock.location=0 \
    ro.adb.secure=0 \
    ro.debuggable=1

PRODUCT_CHARACTERISTICS := tablet,sdcard

# Audio
PRODUCT_PACKAGES += \
	audio.primary.tcc892x

PRODUCT_PACKAGES += \
	tinymix \
	tinyplay \
	tinycap

PRODUCT_PACKAGES += \
	fm

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# WiFi Direct currently is disabled
#~ frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

# Inherited configuration
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product, build/target/product/generic_no_telephony.mk)
$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
