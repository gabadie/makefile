
ifeq ($(extension_entry),/config/pre)

CMD_COMPILOR_S = $(CMD_PREFIX)gcc -c -x assembler

$(BUILD_DIR)%.s.o: $$(call rwildcard,./,*%.s) $(MAKEFILE_LIST)
	$(CMD_MESSAGE) "asm file <$<>"
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR)
	$(CMD_COMPILOR_S) $(S_FLAGS) $< -o $@

endif

