
GLOBAL_UPDATE_TARGETS += $(STATICLIB_TARGETS)

CMD_LINK_LIB = $(CMD_PREFIX)ar -rcs

$(STATICLIB_TARGETS): %:
	$(CMD_ECHO) "# linking static lib <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_RM) $@
	$(CMD_LINK_LIB) $@ $^

