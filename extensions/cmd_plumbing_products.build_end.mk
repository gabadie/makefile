
PLUMBING_PRODUCTS = $(PLUMBING_PREFIX)products

.PHONY: $(PLUMBING_PRODUCTS)
$(PLUMBING_PRODUCTS):
	@echo > /dev/null; $(foreach PRODUCT,$(PROJECT_PRODUCTS_SELECTED),\
            echo "$(call product_target,$(PRODUCT))";\
        )

