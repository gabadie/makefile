
#------------------------------------------------------------------------------- EXPLICIT mk BEGIN

ifdef ($(mk))

include $(mk)

else


#------------------------------------------------------------------------------- MAKE SETUP

#
# We require the second expension extension
#
.SECONDEXPANSION:

#
# We don't want to have dirty messaging when calling recursive makefile
#
MAKEFLAGS += --no-print-directory

#
# If make version 4.00 or higher, then we activate the --output-sync=target
#
ifeq (4.00,$(firstword $(sort $(MAKE_VERSION) 4.00)))
    MAKEFLAGS += --output-sync=target
endif


#------------------------------------------------------------------------------- GENERAL PURPOSE

MK_THIS := $(lastword $(MAKEFILE_LIST))
MK_DIR := $(dir $(MK_THIS))/../
MK_MAKEFILE_LIST = $(MAKEFILE_LIST)
MK_DEPENDENCIES = $(MK_MAKEFILE_LIST)
MK_SPREADING_PARAMETERS =
MK_SRC_DIR := $(MK_DIR)src/

GENERAL_VERSION = April 2014


#------------------------------------------------------------------------------- CORE

include $(MK_SRC_DIR)core/functions.mk


#------------------------------------------------------------------------------- GLOBAL VARS

PROJECT_PRODUCTS =
PROJECT_PRODUCTS_SELECTED = $(if $(products),$(filter $(products),$(PROJECT_PRODUCTS)),$(PROJECT_PRODUCTS))


#------------------------------------------------------------------------------- COMMANDS SYMBOLS

CMD_PREFIX ?= @

CMD_CP = $(CMD_PREFIX)cp
CMD_ECHO = @echo
CMD_IDLE = $(CMD_ECHO) > /dev/null
CMD_MESSAGE = $(CMD_ECHO) "\#" $(message_indent)
CMD_MKDIR = $(CMD_PREFIX)mkdir
CMD_MKDIR_ALL = $(CMD_MKDIR) -p
CMD_RM = $(CMD_PREFIX)rm
CMD_PAGER = $(CMD_PREFIX)less

PLUMBING_PREFIX := plumbing_


#------------------------------------------------------------------------------- DEFAULT ENTRY

.PHONY: _default_entry
_default_entry: $$(MK_DEFAULT_ENTRIES)
	$(CMD_IDLE)


#------------------------------------------------------------------------------- PROJECT DIR

PROJECT_DIR ?= ./


#------------------------------------------------------------------------------- BUILD DIRECTORY

BUILD_DIR_PREFIX = $(PROJECT_DIR)build-
BUILD_DIR = $(BUILD_DIR_PREFIX)$(config)/
BUILD_PRODUCT_DIR = $(BUILD_DIR)products/
BUILD_SURVIVORS += $(BUILD_PRODUCT_DIR)


#------------------------------------------------------------------------------- PRE-CONFIG EXTENSIONS

MK_SRC_LIST := $(call filelist,$(MK_SRC_DIR)ext.mk.flist)

extension_entry :=/config/pre
include $(MK_SRC_LIST)


#------------------------------------------------------------------------------- CONFIG

config ?= default

MK_CONFIG_PATH = $(PROJECT_DIR)candy_project.mk

ifeq ($(wildcard $(MK_CONFIG_PATH)),)
    $(error $(MK_CONFIG_PATH) does not exist)
else
    include $(MK_CONFIG_PATH)
endif


#------------------------------------------------------------------------------- POST-CONFIG EXTENSIONS

extension_entry :=/config/post
include $(MK_SRC_LIST)


#------------------------------------------------------------------------------- PARALLEL EXTENSIONS

ifeq ($(PROJECT_PARALLEL),true)

extension_entry :=/parallel
include $(MK_SRC_LIST)

endif


#------------------------------------------------------------------------------- NOT PARALLEL EXTENSIONS

ifneq ($(PROJECT_PARALLEL),true)

.NOTPARALLEL:

extension_entry :=/linear
include $(MK_SRC_LIST)

endif


#------------------------------------------------------------------------------- EXPLICIT mk END

endif

