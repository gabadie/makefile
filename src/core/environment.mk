
#
# @infos: check if a environment exist
#
# @uses:
#   $(call env_exists, $(SHELL_FUNCTION))
#
# @param <SHELL_FUNCTION>: shell executable to check
#
# @example:
#   $(call env_exists, clang)
#
env_which=$(notdir $(shell which $1))

#
# @infos: give environment prefrences
#
# @uses:
#   $(call rwildcard,$(DIR),$(MATCH))
#
# @param <DIR>: directory to search in
# @param <MARCH>: file match (ex: *.c)
#
env_preference=$(if $1,$(strip $(if $(call env_which, $(firstword $1)),\
	$(firstword $1),\
	$(call env_preference,$(filter-out $(firstword $1), $1))\
)),$(error "env_preference: can't find any prefered environment"))
