
#
# @uses:
#   $(call project_product,$(EXTERN_PROJECT_DIR),$(PRODUCT_NAME))
#   $(call project_product,$(EXTERN_PROJECT_DIR),$(PRODUCT_NAME),$(OPTIONS))
#
#
#
project_product = $2 \
    $(eval PRODUCT_$(strip $2)_TYPE = EXTERNAL)\
    $(eval PRODUCT_$(strip $2)_TARGET = $1$(shell make -C $1 plumbing_product_target products=$(strip $2) $3)) \
    $(eval EXTERNAL_PRODUCTS += $(strip $2)) \
    $(eval $(call product_target,$2): EXTERNAL_PROJECT_DIR = $1) \
    $(eval $(call product_target,$2): EXTERNAL_PROJECT_PRODUCT = $2) \
    $(eval $(call product_target,$2): EXTERNAL_PROJECT_OPTIONS = $3)

