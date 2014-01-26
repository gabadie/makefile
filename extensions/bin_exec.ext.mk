
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,ld,g++)

BINEXEC_EXTENSION =
RUN_PRODUCTS += $(BINEXEC_PRODUCTS)
MK_KNOWN_PRODUCT_TYPES += BINEXEC

endif

ifeq ($(extension_entry),/config/post)

BINEXEC_TARGETS := $(foreach PROD,$(BINEXEC_PRODUCTS), $(call product_target,$(PROD)))

$(BINEXEC_TARGETS): %: $$(LDDEPS)
	$(call history_rule,linking executable,$@)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_PREFIX)$(ld) -o $@ $(LDFLAGS)

endif

