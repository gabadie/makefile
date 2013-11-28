
BINEXEC_TARGETS := $(foreach PROD,$(BINEXEC_PRODUCTS), $(call product_target,$(PROD)))
BINEXEC_CMD = $(CMD_PREFIX)g++

PROJECT_TARGETS += $(BINEXEC_TARGETS)

$(BINEXEC_TARGETS): %:
	$(CMD_MESSAGE) "linking executable <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(BINEXEC_CMD) $(LINK_BINEXEC_FLAGS) -o $@ $^

