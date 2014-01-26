
ifeq ($(extension_entry),/linear)

#
# make run/product/<product_name>
#

$(foreach PRODUCT,$(PROJECT_PRODUCTS), \
    $(if $(strip $(call product_run_cmd,$(PRODUCT))), \
        $(eval run/product/$(PRODUCT): $(call product_target,$(PRODUCT))) \
        $(eval run/product/$(PRODUCT): SELF_PRODUCT = $(PRODUCT)) \
        $(eval RUN_RULES += run/product/$(PRODUCT)) \
    ) \
)

.PHONY: $(RUN_RULES)

$(RUN_RULES):
	$(CMD_MESSAGE) "running <$<> ..."
	$(CMD_PREFIX)$(call product_run_cmd,$(SELF_PRODUCT))


#
# make run/all
#

.PHONY: run/all
run/all: $(RUN_RULES)
	$(CMD_IDLE)

endif

