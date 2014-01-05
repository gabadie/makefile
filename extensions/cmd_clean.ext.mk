
ifeq ($(extension_entry),/linear)

.PHONY: clean
clean:
	$(CMD_RM) -rf $(filter-out $(patsubst %/,%,$(BUILD_SURVIVORS)),$(wildcard $(BUILD_DIR)*))

endif

