#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device.mk
$(call inherit-product, device/sony/pdx213/device.mk)

$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_pdx213
PRODUCT_DEVICE := pdx213
PRODUCT_MANUFACTURER := Sony
PRODUCT_BRAND := Sony
PRODUCT_MODEL := XQ-BT44

PRODUCT_GMS_CLIENTID_BASE := android-sonymobile

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="XQ-BT44-user 12 62.1.A.1.431 062001A001043103799172538 release-keys" \
    BuildFingerprint=Sony/XQ-BT44/XQ-BT44:12/62.1.A.1.431/062001A001043103799172538:user/release-keys \
    DeviceName=XQ-BT44 \
    DeviceProduct=XQ-BT44 \
    SystemDevice=XQ-BT44 \
    SystemName=XQ-BT44
