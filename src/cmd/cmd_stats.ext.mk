
ifeq ($(extension_entry),/config/pre)

STATS_EXTENSIONS += *.mk

endif

ifeq ($(extension_entry),/linear)

STATS_COMMANDS = $(addprefix stats/, $(subst *,,$(STATS_EXTENSIONS)))

.PHONY: stats
stats: $(sort $(STATS_COMMANDS))
	$(CMD_IDLE)


.PHONY: $(STATS_COMMANDS)
$(STATS_COMMANDS):
	$(CMD_MESSAGE) $(notdir $@) : $(shell cat /dev/null $(call rwildcard,./,*$(notdir $@)) | grep -v "^[ ]*#$#" | wc -l) lines

endif

