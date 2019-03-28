ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
# ---------------------------------------------------------------------------------
#                 Common definitons
# ---------------------------------------------------------------------------------

libAudioLogUtils-def := -g -O3
libAudioLogUtils-def += -DQC_MODIFIED
libAudioLogUtils-def += -D_ANDROID_
libAudioLogUtils-def += -D_ENABLE_QC_MSG_LOG_
libAudioLogUtils-def += -DVERBOSE
libAudioLogUtils-def += -D_DEBUG
libAudioLogUtils-def += -Wconversion
libAudioLogUtils-def += -DAUDIOV2

# ---------------------------------------------------------------------------------
#             Make the Shared library (libAudioLogUtils)
# ---------------------------------------------------------------------------------

include $(CLEAR_VARS)

libAudioLogUtils-inc       := $(LOCAL_PATH)/inc
libAudioLogUtils-inc       += $(TARGET_OUT_HEADERS)/mm-core/omxcore

LOCAL_MODULE             := libaudio_log_utils
LOCAL_MODULE_TAGS        := optional
LOCAL_VENDOR_MODULE      := true
LOCAL_CFLAGS            := $(libAudioLogUtils-def)
LOCAL_C_INCLUDES        := $(libAudioLogUtils-inc)
LOCAL_PRELINK_MODULE    := false
LOCAL_SHARED_LIBRARIES  := libutils liblog 
#LOCAL_SHARED_LIBRARIES  += audio.primary.msm8953
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
LOCAL_MULTILIB          := 32
LOCAL_SRC_FILES         := src/audio_log_utils.c

LOCAL_EXPORT_C_INCLUDE_DIRS := \
    $(LOCAL_PATH)/inc \

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/vendor/qcom/opensource/audio-kernel/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(BOARD_VENDOR_KERNEL_MODULES)

include $(BUILD_SHARED_LIBRARY)

endif

# ---------------------------------------------------------------------------------
#                     END
# ---------------------------------------------------------------------------------

