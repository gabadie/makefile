
ifeq ($(extension_entry),/config/post)

#
# @infos: runs build/update as a parallel target
#
.PHONY: build/update
$(call parallel_targets,build/update)

endif

ifeq ($(extension_entry),/linear)

MK_DEFAULT_ENTRIES += build/update

#
# Commands build/full and build/full/rec
#
.PHONY: build/full build/full/rec
build/full/rec: EXTERNAL_REC_OPTIONS = build/full/rec
build/full build/full/rec: trash build/update
	$(CMD_IDLE)

#
# Commands build/product/<product_name>
#
.PHONY: $(patsubst %,build/product/%,$(PROJECT_PRODUCTS))
$(foreach PRODUCT,$(PROJECT_PRODUCTS), \
    $(eval build/product/$(PRODUCT): $(call product_target, $(PRODUCT)); $(CMD_IDLE)) \
)

#
# Shortcut build/update as build
#
.PHONY: build
build: build/update
	$(CMD_IDLE)

endif

ifeq ($(extension_entry),/parallel)

#
# Command build/update
#
build/update: $(foreach PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),$(call product_target,$(PRODUCT)))
	$(CMD_IDLE)

endif
