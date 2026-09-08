#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/sony/pdx213

# Screen
TARGET_SCREEN_HEIGHT := 2520
TARGET_SCREEN_WIDTH := 1080

# Device info
# Three physical rear sensors: imx486 wide, s5k4h7yx ultra wide and ov8856
# tele.  Left to the camera HAL these would be counted along with the two
# logical cameras built on the wide sensor, and the list would read
# 12 + 8 + 8 + 12 + 12.
CAMERA_REAR_INFO := 12,8,8
CAMERA_FRONT_INFO := 8

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Overlays
PRODUCT_PACKAGES += \
    FrameworkRes-PDX213-Overlay \
    SystemUIRes-PDX213-Overlay

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/sony

# Shims
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    libhidlbase_shim

# Fingerprint
PRODUCT_PACKAGES += \
    vendor.egistec.hardware.fingerprint@4.0

# Inherit from sm6350-common
$(call inherit-product, device/sony/sm6350-common/common.mk)

# Vendor blobs
$(call inherit-product, vendor/sony/pdx213/pdx213-vendor.mk)
