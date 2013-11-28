
STATICLIB_TARGETS := $(foreach PROD,$(STATICLIB_PRODUCTS), $(call product_target,$(PROD)))
STATICLIB_CMD = $(CMD_PREFIX)ar -rcs

PROJECT_TARGETS += $(STATICLIB_TARGETS)

$(STATICLIB_TARGETS): %:
	$(CMD_ECHO) "# linking static lib <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_RM) -f $@
	$(STATICLIB_CMD) $@ $^

