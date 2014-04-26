
ifeq ($(extension_entry),/config/pre)

#
# @infos: declares all configurations to trash
#
# @example:
#   $(call trash_configs, debug release)
#
trash_configs = $(eval _TRASH_CONFIGS = $1)

endif

ifeq ($(extension_entry),/linear)

_TRASH_CONFIGS ?= default

.PHONY: trash
trash:
	$(CMD_RM) -rf $(addprefix $(BUILD_DIR_PREFIX),$(_TRASH_CONFIGS))

endif
