
ifeq ($(extension_entry),/config/pre)

PROJECT_CLOBBER_FILE = $(PROJECT_DIR)clobber
BUILD_CLOBBER_FILE = $(BUILD_DIR)clobber
BUILD_SURVIVORS += $(BUILD_CLOBBER_FILE)

ifeq ($(wildcard $(PROJECT_CLOBBER_FILE)),$(strip $(PROJECT_CLOBBER_FILE)))
MK_DEPENDENCIES += $(BUILD_CLOBBER_FILE)
endif

endif

ifeq ($(extension_entry),/config/post)

$(BUILD_CLOBBER_FILE): $(PROJECT_CLOBBER_FILE)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_CP) $< $@

ifeq ($(wildcard $(BUILD_CLOBBER_FILE)),$(strip $(BUILD_CLOBBER_FILE)))
ifeq ($(shell python -c "from os import path ; print str(path.getmtime('$(PROJECT_CLOBBER_FILE)') > path.getmtime('$(BUILD_CLOBBER_FILE)'))"),True)
$(shell rm -rf $(BUILD_DIR))
endif
endif

endif

ifeq ($(extension_entry),/linear)

ifeq ($(filter clobber,$(MAKECMDGOALS)),clobber)
.PHONY: clobber
clobber: trash
	$(CMD_PREFIX)date > $(PROJECT_CLOBBER_FILE)
endif

endif

