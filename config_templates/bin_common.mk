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

CMD_PREFIX =

PROJECT_NAME ?= $(notdir $(shell pwd | sed 's/ /\\/g'))
PROJECT_TYPE ?= EXEC

PRODUCT_NAME := $(call product_create,$(PROJECT_TYPE),$(PROJECT_NAME))
PRODUCT_TARGET := $(call product_target,$(PRODUCT_NAME))

$(PRODUCT_TARGET): C_FLAGS = $(GLOBAL_C_FLAGS)
$(PRODUCT_TARGET): $(call o_files,$(call rfindall,cpp) $(call rfindall,c) $(call rfindall,s))

.PHONY: run
run: $(PRODUCT_TARGET)
	$(CMD_ECHO) "# running application <$<>"
	$(CMD_PREFIX)./$<

