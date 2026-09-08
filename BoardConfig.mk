#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

include device/sony/sm6350-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pdx213

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG :=
BOARD_KERNEL_SEPARATED_DTBO :=

BOARD_INCLUDE_RECOVERY_DTBO := true

BOARD_KERNEL_CMDLINE += buildproduct=pdx213_jp

# Props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

-include vendor/sony/pdx213/BoardConfigVendor.mk
