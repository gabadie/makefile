
BUILD_DEPS_DIR ?= $(BUILD_DIR)deps/

-include $(call rwildcard,$(BUILD_DEPS_DIR),*.d)

