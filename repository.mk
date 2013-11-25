
MK_REPOSITORY_DIR = $(lastword $(call url_find_parent,$(PROJECT_DIR),.mkrepo/))

ifeq ($(MK_REPOSITORY_DIR),)
    MK_REPOSITORY_DIR = $(PROJECT_DIR).mkrepo/
endif

#
# @infos: Fetches param's value from the repository
#
# @uses:
#    $(call mkrepo_fetch_param,PARAMETER_NAME)
#
# @param <PARAMETER_NAME>: parameter's name
#
mkrepo_fetch_param = $(shell cat "$(MK_REPOSITORY_DIR)$1" 2> /dev/null)

#
# @infos: Load param if not already seted, specifying a default value in cas
#
# @uses:
#    $(call mkrepo_load_param,PARAMETER_NAME,$(DEFAULT_VALUE))
#
# @param <PARAMETER_NAME>: parameter's name
# @param <DEFAULT_VALUE>: parameter's default value
#
mkrepo_load_param = $($(eval TMP_VALUE := $(call mkrepo_fetch_param,$1))$(if $(TMP_VALUE),$(eval $1 ?= $(TMP_VALUE)),$(eval $1 := $2)))

