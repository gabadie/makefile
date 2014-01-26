
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,cc,gcc -c -x c)
$(call mkrepo_load_param,cxx,g++ -c -x c++)

STATS_EXTENSIONS += *.c *.cpp

endif

ifeq ($(extension_entry),/config/post)

$(BUILD_OBJ_DIR)%.c.o: $$(call rwildcard,./,*%.c) $$(MK_DEPENDENCIES)
	$(call history_rule,compiling c file,$<)
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_PREFIX)$(cc) $(C_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

$(BUILD_OBJ_DIR)%.cpp.o: $$(call rwildcard,./,*%.cpp) $$(MK_DEPENDENCIES)
	$(call history_rule,compiling c++ file,$<)
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_PREFIX)$(cxx) $(CPP_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

endif

