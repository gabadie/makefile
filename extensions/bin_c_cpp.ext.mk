
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,cc,gcc -c -x c)
$(call mkrepo_load_param,cxx,g++ -c -x c++)

endif

ifeq ($(extension_entry),/config/post)

$(BUILD_OBJ_DIR)%.c.o: $$(call rwildcard,./,*%.c) $$(MK_DEPENDENCIES)
	$(CMD_MESSAGE) "c file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(cc) $(C_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

$(BUILD_OBJ_DIR)%.cpp.o: $$(call rwildcard,./,*%.cpp) $$(MK_DEPENDENCIES)
	$(CMD_MESSAGE) "c++ file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(cxx) $(CPP_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

endif

