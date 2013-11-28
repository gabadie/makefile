
.PHONY: clean
clean:
	$(CMD_RM) -rf $(BUILD_DIR)

include $(extension_entry)

