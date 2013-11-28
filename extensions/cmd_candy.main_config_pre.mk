
.PHONY: candy
candy:
	$(CMD_MESSAGE) "make candy 🍬 "
	$(CMD_MESSAGE) "version: $(GENERAL_VERSION)"
	$(CMD_MESSAGE) "developed by Guillaume Abadie"

include $(extension_entry)

