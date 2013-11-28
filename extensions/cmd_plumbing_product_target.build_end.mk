
PLUMBING_PRODUCT_TARGET = $(PLUMBING_PREFIX)product_target

.PHONY: $(PLUMBING_PRODUCT_TARGET)
$(PLUMBING_PRODUCT_TARGET):
	@echo > /dev/null; $(foreach PRODUCT,$(PROJECT_PRODUCTS_SELECTED),\
            echo "$(call product_target,$(PRODUCT))";\
        )

