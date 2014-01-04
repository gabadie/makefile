
ifeq ($(extension_entry),/config/pre)

#
# @infos: fetch a product from an another project
#
# @uses:
#   $(call project_product,$(EXTERN_PROJECT_DIR),$(PRODUCT_NAME))
#   $(call project_product,$(EXTERN_PROJECT_DIR),$(PRODUCT_NAME),$(OPTIONS))
#
# @examples:
#   $(call project_product,../hello_lib/,hello_lib,config=release)
#
project_product = $2 \
    $(eval PRODUCT_$(strip $2)_TYPE = EXTERNAL)\
    $(eval PRODUCT_$(strip $2)_PROJECT_DIR := $1)\
    $(eval PRODUCT_$(strip $2)_TARGET := $1$(shell make -C $1 product/$(strip $2)/target $3)) \
    $(eval EXTERNAL_PRODUCTS += $(strip $2)) \
    $(eval $(call product_target,$2): EXTERNAL_PROJECT_DIR = $1) \
    $(eval $(call product_target,$2): EXTERNAL_PROJECT_PRODUCT = $2) \
    $(eval $(call product_target,$2): EXTERNAL_PROJECT_OPTIONS = $3) \
    $(foreach FUNCTION,$(EXTERNAL_PRODUCT_ENTRIES),$(call $(FUNCTION),$1,$2))

endif

ifeq ($(extension_entry),/config/post)

EXTERNAL_TARGETS := $(foreach PROD,$(EXTERNAL_PRODUCTS), $(call product_target,$(PROD)))

.PHONY: $(EXTERNAL_TARGETS)
$(EXTERNAL_TARGETS): %:
	$(CMD_MESSAGE) "external product <$(EXTERNAL_PROJECT_PRODUCT)> (in project $(EXTERNAL_PROJECT_DIR))"
	$(CMD_PREFIX)make -C $(EXTERNAL_PROJECT_DIR) $(EXTERNAL_PROJECT_OPTIONS) $(EXTERNAL_REC_OPTIONS) products=$(EXTERNAL_PROJECT_PRODUCT) "message_indent=$(message_indent) ."
	$(CMD_MESSAGE)

endif

