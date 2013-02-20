$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/targa/utab_7.6/utab_7.6-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/targa/utab_7.6/overlay

LOCAL_PATH := device/targa/utab_7.6
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m805_892x
PRODUCT_DEVICE := m805_892x

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    persist.sys.usb.config=mass_storage \
    ro.adb.secure=0
