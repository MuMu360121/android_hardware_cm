ifeq ($(BOARD_USES_CAMERASHIM),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false

LOCAL_SHARED_LIBRARIES += \
    libdl \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libhardware \
    libcamera_client \
    libui \
    $(BOARD_CAMERA_LIBRARIES)


ifneq ($(BOARD_CAMERA_MOTOROLA_COMPAT),)
LOCAL_CFLAGS += \
    -DMOTOROLA_CAMERA
endif

include $(BUILD_SHARED_LIBRARY)

endif