
#------------------------------------------------------------------------------- GENERAL PURPOSE

MK_THIS := $(lastword $(MAKEFILE_LIST))
MK_DIR := $(dir $(MK_THIS))


#------------------------------------------------------------------------------- FUNCTIONS

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))
rfindall=$(call rwildcard,./,*.$1)


#------------------------------------------------------------------------------- GLOBAL VARS

UPDATE_TARGETS =


#------------------------------------------------------------------------------- COMMANDS

.SECONDEXPANSION:
.PHONY: update clean full

update: $$(GLOBAL_UPDATE_TARGETS)
	$(CMD_ECHO) "# build finished"

clean:
	$(CMD_RM) -rf $(BUILD_DIR)

full: clean update


#------------------------------------------------------------------------------- PRE-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),pre_config.*.ext.mk)


#------------------------------------------------------------------------------- PRE-CONFIG INIT

PROJECT_DIR ?= ./
BUILD_DIR ?= $(PROJECT_DIR)build/
BUILD_PRODUCT_DIR ?= $(BUILD_DIR)product/


#------------------------------------------------------------------------------- CONFIG

-include config.mk


#------------------------------------------------------------------------------- POST-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),post_config.*.ext.mk)


#------------------------------------------------------------------------------- COMMANDS

CMD_PREFIX ?= @

CMD_CP = $(CMD_PREFIX)cp
CMD_ECHO = @echo
CMD_MKDIR = $(CMD_PREFIX)mkdir
CMD_MKDIR_ALL = $(CMD_MKDIR) -p
CMD_RM = $(CMD_PREFIX)rm


#------------------------------------------------------------------------------- INCLUDES

-include $(call rwildcard,./,*.d)

