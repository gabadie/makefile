
ifeq ($(extension_entry),/linear)

.PHONY: $(patsubst %,product/%/target,$(PROJECT_PRODUCTS))

$(foreach PRODUCT,$(PROJECT_PRODUCTS), \
    $(eval product/$(PRODUCT)/target: ; $(CMD_ECHO) $(call product_target, $(PRODUCT))) \
)

endif

