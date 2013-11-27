
BUILD_DEPS_DIR ?= $(BUILD_DIR)dep/

-include $(call rwildcard,$(BUILD_DEPS_DIR),*.d)

