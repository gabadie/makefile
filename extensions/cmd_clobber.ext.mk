
ifeq ($(extension_entry),/config/pre)

PROJECT_CLOBBER_FILE = $(PROJECT_DIR)clobber
BUILD_CLOBBER_FILE = $(BUILD_DIR)clobber

ifeq ($(wildcard $(PROJECT_CLOBBER_FILE)),$(strip $(PROJECT_CLOBBER_FILE)))
MK_DEPENDENCIES += $(BUILD_CLOBBER_FILE)
endif

$(BUILD_CLOBBER_FILE): $(PROJECT_CLOBBER_FILE)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_CP) $< $@

endif

ifeq ($(extension_entry),/linear)

ifeq ($(filter clobber,$(MAKECMDGOALS)),clobber)
.PHONY: clobber
clobber:
	$(CMD_PREFIX)date > $(PROJECT_CLOBBER_FILE)
endif

endif

