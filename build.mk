
#------------------------------------------------------------------------------- GENERAL PURPOSE

MK_THIS := $(lastword $(MAKEFILE_LIST))
MK_DIR := $(dir $(MK_THIS))


#------------------------------------------------------------------------------- FUNCTIONS

include $(MK_DIR)functions.mk


#------------------------------------------------------------------------------- GLOBAL VARS

GLOBAL_UPDATE_TARGETS =


#------------------------------------------------------------------------------- COMMANDS SYMBOLS

CMD_PREFIX ?= @

CMD_CP = $(CMD_PREFIX)cp
CMD_ECHO = @echo
CMD_MKDIR = $(CMD_PREFIX)mkdir
CMD_MKDIR_ALL = $(CMD_MKDIR) -p
CMD_RM = $(CMD_PREFIX)rm


#------------------------------------------------------------------------------- PROJECT DIR

PROJECT_DIR ?= ./


#------------------------------------------------------------------------------- MK REPOSITORY

MK_REPOSITORY_DIR = $(lastword $(call url_find_parent,$(PROJECT_DIR),.mkrepo/))

MK_SELECTED_CONFIG = default_config

ifeq ($(MK_REPOSITORY_DIR),)
    MK_REPOSITORY_DIR = $(PROJECT_DIR).mkrepo/
else
    MK_SELECTED_CONFIG = $(shell cat "$(MK_REPOSITORY_DIR)selected_config")
endif

ifdef config
    MK_SELECTED_CONFIG = $(config)
endif


#------------------------------------------------------------------------------- COMMANDS

BUILD_DIR ?= $(PROJECT_DIR)build-$(MK_SELECTED_CONFIG)/
BUILD_PRODUCT_DIR ?= $(BUILD_DIR)product/


#------------------------------------------------------------------------------- COMMANDS

.SECONDEXPANSION:
.PHONY: update clean full

update: $$(GLOBAL_UPDATE_TARGETS)
	$(CMD_ECHO) "# build finished"

clean:
	$(CMD_RM) -rf $(BUILD_DIR)

full: clean update

set:
	$(CMD_MKDIR_ALL) $(MK_REPOSITORY_DIR)
	$(CMD_ECHO) $(MK_SELECTED_CONFIG) > $(MK_REPOSITORY_DIR)selected_config


#------------------------------------------------------------------------------- PRE-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),pre_config.*.ext.mk)


#------------------------------------------------------------------------------- CONFIG

MK_CONFIG_PATH = $(MK_SELECTED_CONFIG).mk

ifeq ($(wildcard $(MK_CONFIG_PATH)),)
    $(error $(MK_CONFIG_PATH) does not exist)
else
    include $(MK_CONFIG_PATH)
endif


#------------------------------------------------------------------------------- POST-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),post_config.*.ext.mk)

