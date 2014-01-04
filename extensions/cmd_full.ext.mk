
ifeq ($(extension_entry),/linear)

.PHONY: full full/rec
full/rec: EXTERNAL_REC_OPTIONS = full/rec

full full/rec: clean $$(PROJECT_TARGETS)
	$(CMD_IDLE)

endif

