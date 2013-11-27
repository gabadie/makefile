
GLOBAL_UPDATE_TARGETS += $(LIBHEADER_TARGETS)

$(LIBHEADER_TARGETS): $(BUILD_INCLUDE_DIR)%: %
	$(CMD_ECHO) "# library header <$<>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_CP) $< $@

