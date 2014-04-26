
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,as,gcc -c -x assembler)

STATS_EXTENSIONS += *.s

endif

ifeq ($(extension_entry),/config/post)

$(BUILD_DIR)%.s.o: $$(call rwildcard,./,*%.s) $$(MK_DEPENDENCIES) $$(ASDEPS)
	$(call history_rule,compiling asm file,$<)
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR)
	$(CMD_PREFIX)$(as) -o $@ $< $(ASFLAGS)

endif

