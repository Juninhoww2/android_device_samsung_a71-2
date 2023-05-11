#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# TODO:
#TARGET_HAS_UDFPS := true
#TARGET_IS_LEGACY := true

DEVICE_PATH := device/samsung/a71

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit common device configuration
$(call inherit-product, device/samsung/sm6150-common/common.mk)

PRODUCT_SHIPPING_API_LEVEL := 28
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(DEVICE_PATH)/overlay-lineage/lineage-sdk

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Fingerprint feature
PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.a71

PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/audio_policy_configuration.xml

# Kernel 
TARGET_KERNEL_CONFIG += vendor/samsung/a71.config

# Assert
TARGET_OTA_ASSERT_DEVICE := a71

# Init
PRODUCT_PACKAGES += \
    fstab.qcom