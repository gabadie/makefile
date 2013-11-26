
#------------------------------------------------------------------------------- GENERAL PURPOSE

MK_THIS := $(lastword $(MAKEFILE_LIST))
MK_DIR := $(dir $(MK_THIS))


#------------------------------------------------------------------------------- FUNCTIONS

include $(MK_DIR)functions.mk


#------------------------------------------------------------------------------- LIST ALL MAKEFILES

SUB_MAKEFILES = $(dir $(call rwildcard,./,*/makefile))

MAKECMDGOALS ?= update


#------------------------------------------------------------------------------- GENERIC RULE

.PHONY: $(MAKECMDGOALS)
.NOTPARALLEL:

$(MAKECMDGOALS):
	@$(foreach MAKEFILE_DIR,$(SUB_MAKEFILES), \
            make -C "$(MAKEFILE_DIR)" $@ $(MAKEFLAGS) ; \
        )

