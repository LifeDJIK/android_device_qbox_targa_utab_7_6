$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/unknown/m805_892x/m805_892x-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/unknown/m805_892x/overlay

LOCAL_PATH := device/unknown/m805_892x

# LifeDJIK: Temportary fix to copy prebuilt kernel from non-standard location.
PRODUCT_COPY_FILES += kernel/unknown/m805_892x/prebuilt:kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m805_892x
PRODUCT_DEVICE := m805_892x
