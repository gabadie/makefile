
ifeq ($(extension_entry),/config/pre)


#
# Sets gcc/g++ as default compiler
#
override CC=gcc
override CXX=g++
override AS=gcc

#
# Binary object files's directory
#
BUILD_OBJ_DIR = $(BUILD_DIR)objects/

#
# @infos: Gets object file from source file
#
# @example:
#   $(call bin_object_file,main.cpp)
#
bin_object_file = $(BUILD_OBJ_DIR)$(strip $(notdir $1)).o \
	$(eval $(BUILD_OBJ_DIR)$(strip $(notdir $1)).o: _BIN_SRC_FILE = $1) \
	$(eval $(BUILD_OBJ_DIR)$(strip $(notdir $1)).o: $1)

#
# @infos: Gets object files from source files
#
# @example:
#   $(call bin_object_files,main.cpp hello.c boot.s)
#
bin_object_files = $(foreach FILE,$1,$(call bin_object_file,$(FILE)))

#
# Enables 'make stats' to stats on C/C++ files
#
STATS_EXTENSIONS += *.c *.cpp  *.s

endif

ifeq ($(extension_entry),/config/post)

$(BUILD_OBJ_DIR)%.c.o: $$(MK_DEPENDENCIES) $$(CDEPS)
	$(call history_rule,compiling c file,$(_BIN_SRC_FILE))
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_PREFIX)$(CC) -c -x c -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $(CFLAGS) $(_BIN_SRC_FILE)

$(BUILD_OBJ_DIR)%.cpp.o: $$(MK_DEPENDENCIES) $$(CXXDEPS)
	$(call history_rule,compiling c++ file,$(_BIN_SRC_FILE))
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_PREFIX)$(CXX) -c -x c++ -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $(CXXFLAGS) $(_BIN_SRC_FILE)

$(BUILD_OBJ_DIR)%.s.o: $$(call rwildcard,./,*%.s) $$(MK_DEPENDENCIES) $$(ASDEPS)
	$(call history_rule,compiling asm file,$<)
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR)
	$(CMD_PREFIX)$(AS) -c -x assembler -o $@ $< $(ASFLAGS)

endif
