
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,ld,g++)

BINEXEC_EXTENSION =
RUN_PRODUCTS += $(BINEXEC_PRODUCTS)

endif

ifeq ($(extension_entry),/config/post)

BINEXEC_TARGETS := $(foreach PROD,$(BINEXEC_PRODUCTS), $(call product_target,$(PROD)))

$(BINEXEC_TARGETS): %:
	$(call history_rule,linking executable,$@)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_PREFIX)$(ld) $(BINEXEC_FLAGS) -o $@ $(filter %.o %.a %.c %.cpp %.s,$^)

endif

