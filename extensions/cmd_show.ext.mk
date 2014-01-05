
ifeq ($(extension_entry),/linear)

.PHONY: show/products
show/products:
	$(CMD_IDLE)
	@$(foreach PUBLIC_PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),echo "$(PUBLIC_PRODUCT)";)

.PHONY: show/products/all
show/products/all:
	$(CMD_IDLE)
	@$(foreach PRODUCT,$(PROJECT_PRODUCTS),echo "$(PRODUCT)";)

.PHONY: show/targets
show/targets:
	$(CMD_IDLE)
	@$(foreach PUBLIC_PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),echo "$(call product_target,$(PUBLIC_PRODUCT))";)

.PHONY: show/targets/all
show/targets/all:
	$(CMD_IDLE)
	@$(foreach PRODUCT,$(PROJECT_PRODUCTS),echo "$(call product_target,$(PRODUCT))";)

endif

