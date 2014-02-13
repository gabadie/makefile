
ifeq ($(extension_entry),/config/pre)

#
# @infos: sets precommit hook configurations
#
# @uses:
#   $(call hook_precommit_configs,$(CONFIGS))
#
# @param <CONFIGS>: configurations to tests
#
# @example:
#   $(call hook_precommit_configs, debug release)
#
hook_precommit_configs = \
	$(eval HOOK_PRECOMMIT_CONFIGS = $1)

#
# @infos: sets precommit hook parameters for each configuration
#
# @uses:
#   $(call hook_precommit_params,$(PARAMS))
#
# @param <PARAMS>: makefile parameters
#
# @example:
#   $(call hook_precommit_params, build/update test/update)
#
hook_precommit_params = \
	$(eval HOOK_PRECOMMIT_PARAMS = $1)

endif

ifeq ($(extension_entry),/linear)

HOOK_PRECOMMIT_CONFIGS ?= default
HOOK_PRECOMMIT_PARAMS ?= build/update test/update

.PHONY: hook/precommit
hook/precommit:
	$(CMD_IDLE) ; $(foreach CONFIG_NAME,$(HOOK_PRECOMMIT_CONFIGS), \
		echo \# configuration: $(strip $(CONFIG_NAME)) ; \
		make -C $(PROJECT_DIR) $(MK_SPREADING_PARAMETERS) config=$(strip $(CONFIG_NAME)) $(HOOK_PRECOMMIT_PARAMS) ; \
	)

endif
