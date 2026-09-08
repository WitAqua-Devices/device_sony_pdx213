#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/sony/pdx213

# Screen
TARGET_SCREEN_HEIGHT := 2520
TARGET_SCREEN_WIDTH := 1080

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/sony

# Inherit from sm6350-common
$(call inherit-product, device/sony/sm6350-common/common.mk)

# Vendor blobs
$(call inherit-product, vendor/sony/pdx213/pdx213-vendor.mk)
