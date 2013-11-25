#
# @infos:
#   generic C/C++/ASM application project
#
# @uses:
#   include this file in default_config.mk and just set
#   compilation and linking flags
#
# @minimal example:
#   - default_config.mk:
#       include ../mk/config_templates/bin_application.mk
#
# @example 1:
#   - default_config.mk:
#       PROJECT_NAME = foo_bar
#       GLOBAL_C_CPP_FLAGS = -Werror
#       GLOBAL_LINK_FLAGS = -lm
#
#       include ../mk/config_templatess/bin_application.mk
#
# @additional commands:
#   > make run
#       update and then launch the application
#

PROJECT_NAME ?= $(notdir $(shell pwd | sed 's/ /\\/g'))
PROJECT_TARGET ?= $(BUILD_PRODUCT_DIR)$(PROJECT_NAME)

EXEC_TARGETS += $(PROJECT_TARGET)

$(PROJECT_TARGET): $$(call o_files,$(call rfindall,cpp) $(call rfindall,c) $(call rfindall,s))
$(PROJECT_TARGET): LINK_EXEC_FLAGS = $(GLOBAL_LINK_FLAGS)

.PHONY: run

run: $(PROJECT_TARGET)
	$(CMD_ECHO) "# running application <$(PROJECT_TARGET)>"
	$(CMD_PREFIX)./$(PROJECT_TARGET)

