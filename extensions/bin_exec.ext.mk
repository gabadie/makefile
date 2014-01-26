
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,ld,g++)

BINEXEC_EXTENSION =

#
# @infos: Lets product_create be able to create a BINEXEC product
#
MK_KNOWN_PRODUCT_TYPES += BINEXEC

#
# @infos: gets the running invocation command
#
# @caution: do not use it as is, Consider to use product_run_cmd
#
BINEXEC_run_cmd = ./$(strip $(call product_target,$1))

endif

ifeq ($(extension_entry),/config/post)

BINEXEC_TARGETS := $(foreach PROD,$(BINEXEC_PRODUCTS), $(call product_target,$(PROD)))

$(BINEXEC_TARGETS): %: $$(LDDEPS)
	$(call history_rule,linking executable,$@)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_PREFIX)$(ld) -o $@ $(LDFLAGS)

endif

