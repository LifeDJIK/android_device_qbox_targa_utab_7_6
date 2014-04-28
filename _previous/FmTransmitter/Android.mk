LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
#LOCAL_C_INCLUDES:= external/tinyalsa/include
LOCAL_SRC_FILES:= fm.c
LOCAL_MODULE := fm
#LOCAL_SHARED_LIBRARIES:= libcutils libutils libtinyalsa
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
