#
# Copyright (C) 2025 TWRP device tree for Xiaomi citrine (Redmi Note 14 5G)
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from citrine device
$(call inherit-product, device/xiaomi/citrine/device.mk)

PRODUCT_DEVICE := citrine
PRODUCT_NAME := twrp_citrine
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 14 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="citrine_global-user 14 SP1A.210812.016 OS2.0.207.0.VOQMIXM release-keys"

BUILD_FINGERPRINT := Redmi/citrine_global/citrine:14/SP1A.210812.016/OS2.0.207.0.VOQMIXM:user/release-keys
