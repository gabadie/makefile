
CMD_COMPILOR_C = $(CMD_PREFIX)gcc -c -x c
CMD_COMPILOR_CPP = $(CMD_PREFIX)g++ -c -x c++

$(BUILD_OBJ_DIR)%.c.o: $$(call rwildcard,./,*%.c) $$(MAKEFILE_LIST)
	$(CMD_ECHO) "# c file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_COMPILOR_C) $(C_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

$(BUILD_OBJ_DIR)%.cpp.o: $$(call rwildcard,./,*%.cpp) $$(MAKEFILE_LIST)
	$(CMD_ECHO) "# c++ file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_COMPILOR_CPP) $(CPP_FLAGS) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $<

