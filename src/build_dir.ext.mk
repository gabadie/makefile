
ifeq ($(extension_entry),/config/pre)

#
# Defines build directories
#
BUILD_LOG_DIR = $(BUILD_DIR)logs/
BUILD_TMP_DIR = $(BUILD_DIR)tmp/
BUILD_SRC_GEN_DIR = $(BUILD_DIR)src_generated/

#
# Sets survivor directories when doing 'make clean'
#
BUILD_SURVIVORS += $(BUILD_LOG_DIR)


endif
