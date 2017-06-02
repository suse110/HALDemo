# LOCAL_MODULE的定义规则，hello后面跟有default，hello.default能够保证
# 我们的模块总能被硬象抽象层加载到

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SRC_FILES := hello.c
LOCAL_MODULE := hello.default
include $(BUILD_SHARED_LIBRARY)