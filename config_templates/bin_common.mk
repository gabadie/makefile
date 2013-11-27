#
# @infos:
#   generic C/C++/ASM application project
#
# @uses:
#   include this file in default_config.mk and just set
#   compilation and linking flags
#
# @parameter <PROJECT_TYPE>:
#   - EXEC (default): to build a binary application
#   - STATICLIB: to build a static binary lib
#
# @minimal example:
#   - default_config.mk:
#       include ../mk/config_templates/bin_application.mk
#
# @example 1:
#   - default_config.mk:
#       PROJECT_NAME = foo_bar
#       PROJECT_TYPE = EXEC
#       GLOBAL_C_FLAGS = -Werror
#       GLOBAL_CPP_FLAGS = -Werror
#       GLOBAL_LINK_FLAGS = -lm
#
#       include ../mk/config_templatess/bin_application.mk
#
# @additional commands:
#   > make run
#       update and then launch the application
#

PROJECT_NAME ?= $(notdir $(shell pwd | sed 's/ /\\/g'))
PROJECT_TYPE ?= EXEC

PROJECT_PRODUCT := $(call product_create,$(PROJECT_TYPE),$(PROJECT_NAME))

$(call product_public,$(PROJECT_PRODUCT))
$(call product_set_param,$(PROJECT_PRODUCT),C_FLAGS,$(GLOBAL_C_FLAGS))
$(call product_set_param,$(PROJECT_PRODUCT),CPP_FLAGS,$(GLOBAL_CPP_FLAGS))
$(call product_set_param,$(PROJECT_PRODUCT),S_FLAGS,$(GLOBAL_S_FLAGS))
$(call product_set_param,$(PROJECT_PRODUCT),LINK_EXEC_FLAGS,$(GLOBAL_LINK_FLAGS))
$(call product_add_dependencies,$(PROJECT_PRODUCT),$(call o_files,$(call rfindall,cpp) $(call rfindall,c) $(call rfindall,s)))

$(info $(call product_target,$(PROJECT_PRODUCT)))

.PHONY: run

run: $(call product_target,$(PROJECT_PRODUCT))
	$(CMD_ECHO) "# running application <$<>"
	$(CMD_PREFIX)./$<

