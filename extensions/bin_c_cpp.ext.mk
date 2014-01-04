
ifeq ($(extension_entry),/config/post)

CMD_COMPILOR_C = $(CMD_PREFIX)gcc -c -x c
CMD_COMPILOR_CPP = $(CMD_PREFIX)g++ -c -x c++

$(BUILD_OBJ_DIR)%.c.o: $$(call rwildcard,./,*%.c) $$(MK_DEPENDENCIES)
	$(CMD_MESSAGE) "c file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_COMPILOR_C) $(C_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

$(BUILD_OBJ_DIR)%.cpp.o: $$(call rwildcard,./,*%.cpp) $$(MK_DEPENDENCIES)
	$(CMD_MESSAGE) "c++ file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_COMPILOR_CPP) $(CPP_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

endif

