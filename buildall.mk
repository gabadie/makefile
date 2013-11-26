
#------------------------------------------------------------------------------- LIST ALL MAKEFILES

SUB_MAKEFILES = $(dir $(wildcard */makefile))

MAKECMDGOALS ?= update


#------------------------------------------------------------------------------- GENERIC RULE

.PHONY: $(MAKECMDGOALS)
.NOTPARALLEL:

$(MAKECMDGOALS):
	@$(foreach MAKEFILE_DIR,$(SUB_MAKEFILES), \
            make -C "$(MAKEFILE_DIR)" $@ $(MAKEFLAGS) ; \
        )

