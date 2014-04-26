
ifeq ($(extension_entry),/linear)

.PHONY: travis/setup
travis/setup:
	$(CMD_PREFIX)cp $(MK_DIR)extensions/travis.yml .travis.yml

endif
