
.PHONY: show/products
show/products:
	$(CMD_IDLE)
	@$(foreach PUBLIC_PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),echo "$(PUBLIC_PRODUCT)";)

.PHONY: show/targets
show/targets:
	$(CMD_IDLE)
	@$(foreach TARGET,$(PROJECT_TARGETS),echo $(TARGET);)

