
ifeq ($(extension_entry),/config/pre)

BUILD_DEPS_DIR ?= $(BUILD_DIR)dependencies/

endif

ifeq ($(extension_entry),/config/post)

-include $(call rwildcard,$(BUILD_DEPS_DIR),*.d)

endif

