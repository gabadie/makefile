
ifeq ($(extension_entry),/config/pre)

#
# Sets g++ as default linker
#
override LD=g++

#
# @infos: create a product's target
#
# @caution: do not use it as is, it is automatically called in product_create
#
BINEXEC_create_target = \
    $(BUILD_PRODUCT_DIR)$(strip $1)

#
# @infos: gets the running invocation command
#
# @caution: do not use it as is, Consider to use product_run_cmd
#
BINEXEC_run_cmd = ./$(strip $(call product_target,$1))

#
# @infos: Lets product_create be able to create a BINEXEC product
#
MK_KNOWN_PRODUCT_TYPES += BINEXEC

endif

ifeq ($(extension_entry),/config/post)

BINEXEC_TARGETS := $(foreach PROD,$(BINEXEC_PRODUCTS), $(call product_target,$(PROD)))

$(BINEXEC_TARGETS): %: $$(LDDEPS)
	$(call history_rule,linking executable,$@)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_PREFIX)$(LD) -o $@ $(LDFLAGS)

endif

