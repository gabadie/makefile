
ifeq ($(extension_entry),/linear)

MK_DEFAULT_ENTRIES += build/update

.PHONY: build build/update
build build/update: $$(PROJECT_TARGETS)
	$(CMD_IDLE)

.PHONY: build/full build/full/rec
build/full/rec: EXTERNAL_REC_OPTIONS = build/full/rec

build/full build/full/rec: clean $$(PROJECT_TARGETS)
	$(CMD_IDLE)

endif

