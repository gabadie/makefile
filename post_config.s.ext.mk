
GLOBAL_S_FLAGS ?=

CMD_COMPILOR_S = $(CMD_PREFIX)gcc -c -x assembler

$(BUILD_DIR)%.s.o: $$(call rwildcard,./,*%.s) $(MAKEFILE_LIST)
	$(CMD_ECHO) "# asm file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR)
	$(CMD_COMPILOR_S) $(GLOBAL_S_FLAGS) $(S_FLAGS) $< -o $@

