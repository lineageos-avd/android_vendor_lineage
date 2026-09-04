LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := KernelSU_Next
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := KernelSU_Next.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_APPS)
LOCAL_PRODUCT_MODULE := true

# Keep the official APK byte-for-byte intact while installing its JNI payload
# as bundled-app native libraries. PackageManager does not extract compressed
# JNI libraries from a non-updated system app at first boot.
LOCAL_REPLACE_PREBUILT_APK_INSTALLED := $(LOCAL_PATH)/KernelSU_Next.apk
LOCAL_PREBUILT_JNI_LIBS_arm64 := \
    lib/arm64-v8a/libadbroot.so \
    lib/arm64-v8a/libandroidx.graphics.path.so \
    lib/arm64-v8a/libkernelsu.so \
    lib/arm64-v8a/libksud.so
LOCAL_PREBUILT_JNI_LIBS_x86_64 := \
    lib/x86_64/libadbroot.so \
    lib/x86_64/libandroidx.graphics.path.so \
    lib/x86_64/libkernelsu.so \
    lib/x86_64/libksud.so
include $(BUILD_PREBUILT)
