
ifeq ($(extension_entry),/config/pre)

BUILD_OBJ_DIR ?= $(BUILD_DIR)objects/

#
# @infos: Gets object file from source file
#
# @example:
#   $(call bin_object_file,main.cpp)
#
bin_object_file = $(BUILD_OBJ_DIR)$(strip $(notdir $1)).o

#
# @infos: Gets object files from source files
#
# @example:
#   $(call bin_object_files,main.cpp hello.c boot.s)
#
bin_object_files = $(foreach FILE,$1,$(call bin_object_file,$(FILE)))

endif

