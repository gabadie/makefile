
PLUMBING_PRODUCTS = $(PLUMBING_PREFIX)products

.PHONY: $(PLUMBING_PRODUCTS)
$(PLUMBING_PRODUCTS):
	@echo > /dev/null; $(foreach TARGET,$(GLOBAL_PRODUCTS_SELECTED),\
            echo "$(TARGET)";\
        )

