
ifeq ($(extension_entry),/config/pre)

#
# @infos: return header dependencies
#
# @uses:
#   $(call bin_header_deps,$(MY_HEADER))
#
# @param <MY_HEADER>: path to the header file
#
bin_header_deps = $(filter-out /* ../* : \,$(shell g++ -E -x c++-header -MM -MT "" "$1"))

endif

ifeq ($(extension_entry),/config/post)

BINHEADERS_TARGETS := $(foreach PROD,$(BINHEADERS_PRODUCTS), $(call product_target,$(PROD)))
BINHEADERS_CMD = $(CMD_PREFIX)ar -rcs

PROJECT_TARGETS += $(BINHEADERS_TARGETS)

$(BINHEADERS_TARGETS): %:
	$(CMD_MESSAGE) "headers directory <$@/>"
	$(CMD_RM) -rf $@
	$(CMD_MKDIR_ALL) $@/
	$(CMD_CP) $^ $@ ;\
        if [ $$? -ne 0 ]; then \
            rm -rf $@ ; \
            exit 1; \
        fi;

endif
