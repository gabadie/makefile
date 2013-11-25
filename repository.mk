
MK_REPOSITORY_DIR = $(lastword $(call url_find_parent,$(PROJECT_DIR),.mkrepo/))

ifeq ($(MK_REPOSITORY_DIR),)
    MK_REPOSITORY_DIR = $(PROJECT_DIR).mkrepo/
endif

#
# @infos: Load param if not already seted, specifying a default value in cas
#
# @uses:
#    $(call mkrepo_load_param,PARAMETER_NAME,$(DEFAULT_VALUE))
#
# @param <PARAMETER_NAME>: parameter's name
# @param <DEFAULT_VALUE>: parameter's default value
#
mkrepo_load_param = $($(eval TMP_VALUE := $(shell cat "$(MK_REPOSITORY_DIR)$1" 2> /dev/null))$(if $(TMP_VALUE),$(eval $1 ?= $(TMP_VALUE)),$(eval $1 := $2)))

