
.PHONY: full
full: clean $$(PROJECT_TARGETS)
	$(CMD_MESSAGE) "builds from scratsh finished"

include $(extension_entry)

