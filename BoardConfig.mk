# LifeDJIK: board config goes here
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_PROVIDES_INIT_TARGET_RC := true
BOARD_SKIP_ANDROID_DOC_BUILD := true

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/targa/utab_7.6/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi
TARGET_BOOTLOADER_BOARD_NAME := m805_892x

BOARD_KERNEL_CMDLINE := console=ttyTCC0,115200n8 androidboot.console=ttyTCC0
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

# LifeDJIK: /proc/mtd from my device
#dev:    size   erasesize  name
#mtd0: 00a00000 00100000 "boot"
#mtd1: 00500000 00100000 "kpanic"
#mtd2: 12c00000 00100000 "system"
#mtd3: 00400000 00100000 "splash"
#mtd4: 09600000 00100000 "cache"
#mtd5: 3fe00000 00100000 "userdata"
#mtd6: 00a00000 00100000 "recovery"
#mtd7: 00200000 00100000 "misc"
#mtd8: 00200000 00100000 "tcc"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x12c00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x3fe00000
BOARD_FLASH_BLOCK_SIZE := 1048576

TARGET_PREBUILT_KERNEL := device/targa/utab_7.6/kernel

BOARD_HAS_NO_SELECT_BUTTON := true

# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true
