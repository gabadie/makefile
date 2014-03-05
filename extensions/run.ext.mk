
ifeq ($(extension_entry),/config/pre)

#
# @infos: declares a running environment's extension
#
# @uses:
#	$(call run_set_ext,$(ENV),$(EXT))
#
# @examples:
#	$(call run_set_ext,shell,.sh)
#	$(call run_set_ext,python,.py)
#
run_set_ext = \
	$(eval _RUN_EXT_$(strip $2) = $1)

#
# @infos: gets the environment from the command
#
# @uses:
#	$(call run_get_env_from_ext,$(EXT))
#
# @examples:
#	$(call run_get_env_from_ext,.py)
#
run_get_env_from_ext = \
	$(if $(_RUN_EXT_$(strip $1)), \
		$(_RUN_EXT_$(strip $1)), \
		$(error unknown environment for the given file extension "$(strip $1)") \
	)

#
# @infos: guesses the environement from the file
#
# @uses:
#	$(call run_get_env_from_file,$(EXT))
#
# @examples:
#	$(call run_get_env_from_file,script.py)
#
run_get_env_from_file = \
	$(call run_get_env_from_ext,$(suffix $1))

#
# @infos: guesses the environement from the file or the givent env
#
# @uses:
#	$(call run_guess_env,$(EXT),$(ENV))
#
# @examples:
#	$(call run_guess_env,script.py,shell) (returns shell)
#	$(call run_guess_env,script.py) (return python)
#
run_guess_env = \
	$(if $(strip $2), \
		$2, \
		$(call run_get_env_from_file,$1)\
	)

#
# @infos: set the standart run command
#
# @uses:
#	$(call run_set_cmd,$(ENV),$(CMD))
#
# @examples:
#	$(call run_set_cmd,shell,sh)
#	$(call run_set_cmd,python,python2.7)
#
run_set_cmd = \
	$(eval _RUN_CMD_$(strip $1) = $2)

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
		$(if $(_RUN_CMD_$(strip $1)), \
			$(_RUN_CMD_$(strip $1)), \
			$(error run environment "$(strip $1)" doesn't exist) \
		) \
	)

#
# @infos: get the running command for the given script
#
# @uses:
#	$(call run_script_cmd,$(SCRIPT_PATH))
#	$(call run_script_cmd,$(SCRIPT_PATH),$(ENV))
#
# @examples:
#	$(call run_get_cmd,hello.py)
#	$(call run_get_cmd,hello.py,python)
#
run_script_cmd = \
	$(call run_get_cmd,$(call run_guess_env,$1,$2)) $(strip $1)

#
# @infos: defines the shell environment
#
$(call run_set_cmd,shell,sh)
$(call run_set_ext,shell,.sh)

#
# @infos: defines the python environment
#
$(call run_set_cmd,python,python)
$(call run_set_ext,python,.py)


endif
