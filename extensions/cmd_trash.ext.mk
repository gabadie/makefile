
ifeq ($(extension_entry),/linear)

.PHONY: trash
trash:
	$(CMD_RM) -rf $(BUILD_DIR)

endif

