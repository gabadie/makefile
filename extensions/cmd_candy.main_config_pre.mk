
.PHONY: candy
candy:
	$(CMD_ECHO) "# make candy 🍬 "
	$(CMD_ECHO) "# version: $(GENERAL_VERSION)"
	$(CMD_ECHO) "# developed by Guillaume Abadie"

include $(extension_entry)

