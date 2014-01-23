
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,cxxheader,g++ -x c++-header)

#
# @infos: return header dependencies
#
# @uses:
#   $(call bin_header_deps,$(MY_HEADER))
#
# @param <MY_HEADER>: path to the header file
#
bin_header_deps = $(filter-out /* ../* : \,$(shell $(cxxheader) -E -MM -MT "" "$1"))

MK_KNOWN_PRODUCT_TYPES += BINHEADERS

endif

ifeq ($(extension_entry),/config/post)

BINHEADERS_TARGETS := $(foreach PROD,$(BINHEADERS_PRODUCTS), $(call product_target,$(PROD)))
BINHEADERS_CMD = $(CMD_PREFIX)ar -rcs

$(BINHEADERS_TARGETS): %: $$(MK_DEPENDENCIES)
	$(call history_rule,headers directory,$@)
	$(CMD_RM) -rf $@
	$(CMD_MKDIR_ALL) $@/
	$(CMD_CP) $(filter %.h %.hpp,$^) $@ ;\
        if [ $$? -ne 0 ]; then \
            rm -rf $@ ; \
            exit 1; \
        fi;

endif

