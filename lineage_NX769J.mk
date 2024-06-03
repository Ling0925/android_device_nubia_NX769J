#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from NX769J device
$(call inherit-product, device/nubia/NX769J/device.mk)

PRODUCT_DEVICE := NX769J
PRODUCT_NAME := lineage_NX769J
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NX769J
PRODUCT_MANUFACTURER := nubia

PRODUCT_GMS_CLIENTID_BASE := android-zte

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NX769J-user 14 UKQ1.230917.001 20240315.170858 release-keys"

BUILD_FINGERPRINT := nubia/NX769J/NX769J:14/UKQ1.230917.001/20240315.170858:user/release-keys
