
#------------------------------------------------------------------------------- GENERAL PURPOSE

MK_THIS := $(lastword $(MAKEFILE_LIST))
MK_DIR := $(dir $(MK_THIS))
GENERAL_VERSION = November 2013


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

include $(MK_DIR)repository.mk

$(call mkrepo_load_param,config,default_config)


#------------------------------------------------------------------------------- COMMANDS

BUILD_DIR ?= $(PROJECT_DIR)build-$(config)/
BUILD_PRODUCT_DIR ?= $(BUILD_DIR)product/


#------------------------------------------------------------------------------- COMMANDS

.SECONDEXPANSION:
.PHONY: update clean full

update: $$(GLOBAL_UPDATE_TARGETS)
	$(CMD_ECHO) "# build finished"

clean:
	$(CMD_RM) -rf $(BUILD_DIR)

full: clean update

.PHONY: set
set:
	$(CMD_MKDIR_ALL) $(MK_REPOSITORY_DIR)
	$(CMD_ECHO) $(config) > $(MK_REPOSITORY_DIR)config


#------------------------------------------------------------------------------- CANDY

.PHONY: candy
candy:
	$(CMD_ECHO) "# make candy 🍬 "
	$(CMD_ECHO) "# version: $(GENERAL_VERSION)"
	$(CMD_ECHO) "# developed by Guillaume Abadie"


#------------------------------------------------------------------------------- PRE-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),pre_config.*.ext.mk)


#------------------------------------------------------------------------------- CONFIG

MK_CONFIG_PATH = $(config).mk

ifeq ($(wildcard $(MK_CONFIG_PATH)),)
    $(error $(MK_CONFIG_PATH) does not exist)
else
    include $(MK_CONFIG_PATH)
endif


#------------------------------------------------------------------------------- POST-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),post_config.*.ext.mk)

