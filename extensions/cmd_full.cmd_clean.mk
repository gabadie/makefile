
.PHONY: full
full: clean $$(GLOBAL_UPDATE_TARGETS)
	$(CMD_ECHO) "# builds from scratsh finished"

include $(extension_entry)

