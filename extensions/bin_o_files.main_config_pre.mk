
BUILD_OBJ_DIR ?= $(BUILD_DIR)objects/

#
# @infos: Gets object files from source files
#
# @example:
#   $(call bin_object_files,main.cpp hello.c boot.s)
#
bin_object_files = $(addprefix $(BUILD_OBJ_DIR),$(addsuffix .o,$(notdir $1)))

