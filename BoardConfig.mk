# LifeDJIK: board config goes here
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a5
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true

USE_CAMERA_STUB := true

TARGET_NO_BOOTLOADER := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_BOARD_PLATFORM := tcc892x
TARGET_BOOTLOADER_BOARD_NAME := m805_892x

BOARD_KERNEL_CMDLINE := console=ttyTCC0,115200n8 androidboot.console=ttyTCC0
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

# LifeDJIK: /proc/mtd from my device
# dev:    size   erasesize  name
# mtd0: 00a00000 00100000 "boot"
# mtd1: 00500000 00100000 "kpanic"
# mtd2: 12c00000 00100000 "system"
# mtd3: 00400000 00100000 "splash"
# mtd4: 09600000 00100000 "cache"
# mtd5: 3fe00000 00100000 "userdata"
# mtd6: 00a00000 00100000 "recovery"
# mtd7: 00200000 00100000 "misc"
# mtd8: 00200000 00100000 "tcc"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x12c00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x3fe00000
BOARD_FLASH_BLOCK_SIZE := 1048576

TARGET_PREBUILT_KERNEL := device/qbox/targa_utab_7_6/kernel
#TARGET_KERNEL_SOURCE := kernel/qbox/targa_utab_7_6
#TARGET_KERNEL_CONFIG := targa_utab_7_6_defconfig

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_EGL_CFG := vendor/qbox/targa_utab_7_6/system/lib/egl/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true
USE_OPENGL_RENDERER := true

BOARD_USES_HWCOMPOSER := true

# Mass storage
COMMON_GLOBAL_CFLAGS += -DCUSTOM_LUN_FILE=\"/sys/class/android_usb/android0/f_mass_storage/lun%d/file\"

# NOT VERIFIED -- if it actually works
#BOARD_USES_ALSA_AUDIO := true
#BOARD_USE_TINYALSA_AUDIO := true
#COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB

#~ BOARD_HAVE_GPS := true

#~ BOARD_WPA_SUPPLICANT_DRIVER := WEXT
#~ WPA_SUPPLICANT_VERSION  := VER_0_8_X
#~ WIFI_EXT_MODULE_NAME := wlan
#~ WIFI_EXT_MODULE_PATH := "/system/lib/modules/wlan.ko"
#~ WIFI_DRIVER_MODULE_NAME := wlan
#~ WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"

# inherit from the proprietary version
-include vendor/qbox/targa_utab_7_6/BoardConfigVendor.mk
