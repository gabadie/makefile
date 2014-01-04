
ifeq ($(extension_entry),/config/pre)

BINLIBSTATIC_EXTENSION = .a

endif

ifeq ($(extension_entry),/config/post)

BINLIBSTATIC_TARGETS := $(foreach PROD,$(BINLIBSTATIC_PRODUCTS), $(call product_target,$(PROD)))
BINLIBSTATIC_CMD = $(CMD_PREFIX)ar -rcs

PROJECT_TARGETS += $(BINLIBSTATIC_TARGETS)

$(BINLIBSTATIC_TARGETS): %:
	$(CMD_MESSAGE) "linking static lib <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_RM) -f $@
	$(BINLIBSTATIC_CMD) $@ $^

endif

