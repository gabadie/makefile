
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

