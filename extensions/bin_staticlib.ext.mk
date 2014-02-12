
ifeq ($(extension_entry),/config/pre)

#
# @infos: create a product's target
#
# @caution: do not use it as is, it is automatically called in product_create
#
BINLIBSTATIC_create_target = \
    $(BUILD_PRODUCT_DIR)$(strip $1).a

#
# @infos: Lets product_create be able to create a BINLIBSTATIC product
#
MK_KNOWN_PRODUCT_TYPES += BINLIBSTATIC

endif

ifeq ($(extension_entry),/config/post)

BINLIBSTATIC_TARGETS := $(foreach PROD,$(BINLIBSTATIC_PRODUCTS), $(call product_target,$(PROD)))
BINLIBSTATIC_CMD = $(CMD_PREFIX)ar -rcs

$(BINLIBSTATIC_TARGETS): %: $$(LDDEPS)
	$(call history_rule,building static library,$@)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_RM) -f $@
	$(BINLIBSTATIC_CMD) $@ $(LDFLAGS)

endif

