
#
# make run/product/<product_name>
#

RUN_RULES = $(addprefix run/product/,$(RUN_PRODUCTS))

.PHONY: $(RUN_RULES)

$(foreach PRODUCT,$(RUN_PRODUCTS), \
    $(eval run/product/$(PRODUCT): $(call product_target,$(PRODUCT))) \
)

$(RUN_RULES):
	$(CMD_MESSAGE) "running <$<> ..."
	$(CMD_PREFIX)./$<


#
# make run/all
#

.PHONY: run/all
run/all: $(RUN_RULES)
	$(CMD_IDLE)

