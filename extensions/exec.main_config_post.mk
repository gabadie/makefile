
GLOBAL_UPDATE_TARGETS += $(EXEC_TARGETS)

CMD_LINK_EXEC = $(CMD_PREFIX)g++

$(EXEC_TARGETS): %:
	$(CMD_ECHO) "# linking executable <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_LINK_EXEC) $(LINK_EXEC_FLAGS) -o $@ $^
