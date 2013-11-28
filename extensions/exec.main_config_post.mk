
EXEC_TARGETS := $(foreach PROD,$(EXEC_PRODUCTS), $(call product_target,$(PROD)))
EXEC_CMD = $(CMD_PREFIX)g++

PROJECT_TARGETS += $(EXEC_TARGETS)

$(EXEC_TARGETS): %:
	$(CMD_MESSAGE) "linking executable <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(EXEC_CMD) $(LINK_EXEC_FLAGS) -o $@ $^

