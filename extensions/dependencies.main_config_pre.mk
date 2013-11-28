
BUILD_DEPS_DIR ?= $(BUILD_DIR)dependencies/

-include $(call rwildcard,$(BUILD_DEPS_DIR),*.d)

