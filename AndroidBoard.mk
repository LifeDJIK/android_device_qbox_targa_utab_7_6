LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)
# include the non-open-source counterpart to this file
-include vendor/qbox/targa_utab_7_6/AndroidBoardVendor.mk
