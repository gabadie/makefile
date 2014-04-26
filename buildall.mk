
#------------------------------------------------------------------------------- LIST ALL MAKEFILES

SUB_MAKEFILES = $(dir $(wildcard */makefile))

MAKECMDGOALS ?= _default_entry


#------------------------------------------------------------------------------- MAKEFILE CONFIGURATION

#
# We don't want to have dirty messaging when calling recursive makefile
#
MAKEFLAGS += --no-print-directory


#------------------------------------------------------------------------------- GENERIC RULE

.PHONY: $(MAKECMDGOALS)
.NOTPARALLEL:

$(MAKECMDGOALS):
	@$(foreach MAKEFILE_DIR,$(SUB_MAKEFILES), \
            echo "# makefile <$(MAKEFILE_DIR)makefile>" ; \
            make -C "$(MAKEFILE_DIR)" $@ $(MAKEFLAGS) message_indent=. ; \
            echo "#" ; \
        )

