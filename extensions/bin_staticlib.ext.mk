
ifeq ($(extension_entry),/config/pre)

BINLIBSTATIC_EXTENSION = .a

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

