
ifeq ($(extension_entry),/config/pre)

#
# @infos: set the standart run command
#
# @uses:
#	$(call run_set_cmd,$(ENV),$(CMD))
#
# @examples:
#	$(call run_set_cmd,sh,sh)
#	$(call run_set_cmd,python,python2.7)
#
run_set_cmd = \
	$(eval RUN_CMD_$(strip $1) = $2)

#
# @infos: get the standart run command
#
# @uses:
#	$(call run_get_cmd,$(ENV))
#
# @examples:
#	$(call run_get_cmd,sh)
#	$(call run_get_cmd,python)
#
run_get_cmd = \
	$(if $(strip $1), \
		$(if $(RUN_CMD_$(strip $1)), \
			$(RUN_CMD_$(strip $1)), \
			$(error run environment "$(strip $1)" doesn't exist) \
		) \
	)


endif
