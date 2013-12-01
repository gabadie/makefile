
.PHONY: full full/rec
full/rec: EXTERNAL_REC_OPTIONS = full/rec

full full/rec: clean $$(PROJECT_TARGETS)
	$(CMD_IDLE)

include $(extension_entry)

