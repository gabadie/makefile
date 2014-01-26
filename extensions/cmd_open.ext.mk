
ifeq ($(extension_entry),/linear)

#
# make open/product/<product_name>
#

$(foreach PRODUCT,$(PROJECT_PRODUCTS), \
    $(if $(strip $(call product_open_cmd,$(PRODUCT))), \
        $(eval open/product/$(PRODUCT): $(call product_target,$(PRODUCT))) \
        $(eval open/product/$(PRODUCT): SELF_PRODUCT = $(PRODUCT)) \
        $(eval OPEN_RULES += open/product/$(PRODUCT)) \
    ) \
)

.PHONY: $(OPEN_RULES)

$(OPEN_RULES):
	$(CMD_MESSAGE) "openning <$<> ..."
	$(CMD_PREFIX)$(call product_open_cmd,$(SELF_PRODUCT))


#
# make open/all
#

.PHONY: open/all
open/all: $(OPEN_RULES)
	$(CMD_IDLE)

endif

