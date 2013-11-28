
#------------------------------------------------------------------------------- GENERAL PURPOSE

.SECONDEXPANSION:

MK_THIS := $(lastword $(MAKEFILE_LIST))
MK_DIR := $(dir $(MK_THIS))

GENERAL_VERSION = November 2013


#------------------------------------------------------------------------------- FUNCTIONS

include $(MK_DIR)functions.mk


#------------------------------------------------------------------------------- EXTENSIONS MANAGER

include $(MK_DIR)extension.mk


#------------------------------------------------------------------------------- GLOBAL VARS

PROJECT_PRODUCTS =
PROJECT_PRODUCTS_SELECTED = $(if $(products),$(filter $(products),$(PROJECT_PRODUCTS)),$(PROJECT_PRODUCTS))


#------------------------------------------------------------------------------- COMMANDS SYMBOLS

CMD_PREFIX ?= @

CMD_CP = $(CMD_PREFIX)cp
CMD_ECHO = @echo
CMD_MESSAGE = $(CMD_ECHO) "\#" $(message_indent)
CMD_MKDIR = $(CMD_PREFIX)mkdir
CMD_MKDIR_ALL = $(CMD_MKDIR) -p
CMD_RM = $(CMD_PREFIX)rm

PLUMBING_PREFIX := plumbing_


#------------------------------------------------------------------------------- UPDATE COMMAND

.PHONY: update
update: $$(PROJECT_TARGETS)
	$(CMD_MESSAGE) "builds update finished"


#------------------------------------------------------------------------------- PROJECT DIR

PROJECT_DIR ?= ./


#------------------------------------------------------------------------------- MK REPOSITORY

include $(MK_DIR)repository.mk

$(call mkrepo_load_param,config,default)


#------------------------------------------------------------------------------- COMMANDS

BUILD_DIR ?= $(PROJECT_DIR)build-$(config)/
BUILD_PRODUCT_DIR ?= $(BUILD_DIR)product/


#------------------------------------------------------------------------------- PRE-CONFIG EXTENSIONS

include $(call extension_manual_entry,main_config_pre)


#------------------------------------------------------------------------------- CONFIG

MK_CONFIG_PATH = $(config).mk

ifeq ($(wildcard $(MK_CONFIG_PATH)),)
    $(error $(MK_CONFIG_PATH) does not exist)
else
    include $(MK_CONFIG_PATH)
endif


#------------------------------------------------------------------------------- POST-CONFIG EXTENSIONS

include $(call extension_manual_entry,main_config_post)

include $(call extension_manual_entry,build_end)


#------------------------------------------------------------------------------- NOT PARALLEL EXTENSIONS

.NOTPARALLEL:

include $(call extension_manual_entry,build_linear)

