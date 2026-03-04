#
# Copyright (C) 2025 TWRP device tree for Xiaomi citrine (Redmi Note 14 5G)
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),citrine)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
