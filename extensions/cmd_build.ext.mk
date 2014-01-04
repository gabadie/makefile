
ifeq ($(extension_entry),/linear)

MK_DEFAULT_ENTRIES += build/update

.PHONY: build build/update
build build/update: $(foreach PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),$(call product_target,$(PRODUCT)))
	$(CMD_IDLE)

.PHONY: build/full build/full/rec
build/full/rec: EXTERNAL_REC_OPTIONS = build/full/rec

build/full build/full/rec: clean $(foreach PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),$(call product_target,$(PRODUCT)))
	$(CMD_IDLE)

.PHONY: $(patsubst %,build/product/%,$(PROJECT_PRODUCTS))

$(foreach PRODUCT,$(PROJECT_PRODUCTS), \
    $(eval build/product/$(PRODUCT): $(call product_target, $(PRODUCT)); $(CMD_IDLE)) \
)

endif

