
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

GLOBAL_UPDATE_TARGETS =


#------------------------------------------------------------------------------- COMMANDS SYMBOLS

CMD_PREFIX ?= @

CMD_CP = $(CMD_PREFIX)cp
CMD_ECHO = @echo
CMD_MKDIR = $(CMD_PREFIX)mkdir
CMD_MKDIR_ALL = $(CMD_MKDIR) -p
CMD_RM = $(CMD_PREFIX)rm


#------------------------------------------------------------------------------- UPDATE COMMAND

.PHONY: update
update: $$(GLOBAL_UPDATE_TARGETS)
	$(CMD_ECHO) "# builds update finished"


#------------------------------------------------------------------------------- PROJECT DIR

PROJECT_DIR ?= ./


#------------------------------------------------------------------------------- MK REPOSITORY

include $(MK_DIR)repository.mk

$(call mkrepo_load_param,config,default)


#------------------------------------------------------------------------------- COMMANDS

BUILD_DIR ?= $(PROJECT_DIR)build-$(config)/
BUILD_PRODUCT_DIR ?= $(BUILD_DIR)product/


#------------------------------------------------------------------------------- COMMANDS

.PHONY: clean
clean:
	$(CMD_RM) -rf $(BUILD_DIR)

.PHONY: full
full: clean $$(GLOBAL_UPDATE_TARGETS)
	$(CMD_ECHO) "# builds from scratsh finished"


#------------------------------------------------------------------------------- CANDY

.PHONY: candy
candy:
	$(CMD_ECHO) "# make candy 🍬 "
	$(CMD_ECHO) "# version: $(GENERAL_VERSION)"
	$(CMD_ECHO) "# developed by Guillaume Abadie"


#------------------------------------------------------------------------------- PRE-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),pre_config.*.ext.mk)
include $(call extension_manual_entry,main_config_pre)


#------------------------------------------------------------------------------- CONFIG

MK_CONFIG_PATH = $(config).mk

ifeq ($(wildcard $(MK_CONFIG_PATH)),)
    $(error $(MK_CONFIG_PATH) does not exist)
else
    include $(MK_CONFIG_PATH)
endif


#------------------------------------------------------------------------------- POST-CONFIG EXTENSIONS

include $(call rwildcard,$(MK_DIR),post_config.*.ext.mk)
include $(call extension_manual_entry,main_config_post)

