#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter X00Q,$(TARGET_DEVICE)),)

NEW_PLATFORM_VERSION := 9
NEW_PLATFORM_SECURITY_PATCH := 2019-05-01

LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

BOARD_RECOVERY_IMAGE_PREPARE := \
  sed -i 's/ro.product.name=.*/ro.product.name=OPEN_Phone/g' $(TARGET_RECOVERY_ROOT_OUT)/default.prop ;\
  sed -i '$a ro.config.CID=ASUS' $(TARGET_RECOVERY_ROOT_OUT)/default.prop
endif
