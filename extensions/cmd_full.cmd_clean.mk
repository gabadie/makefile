
.PHONY: full
full: clean $$(PROJECT_TARGETS)
	$(CMD_ECHO) "# builds from scratsh finished"

include $(extension_entry)

