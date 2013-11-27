
#
# @infos: Gets project's product
#
# @uses:
#   $(call project_products,$(EXTERN_PROJECT_DIR))
#   $(call project_products,$(EXTERN_PROJECT_DIR),$(OPTIONS))
#   $(call project_products,$(EXTERN_PROJECT_DIR),$(OPTIONS),$(SPECIFIC_PRODUCTS))
#
# @param EXTERN_PROJECT_DIR: external project's dir
# @param OPTIONS: options (exemple: config=release)
# @param SPECIFIC_PRODUCTS: product list filter (exemple: product_a product_b ...)
#
project_products = $(addprefix $1,$(shell make -C $1 plumbing_products $2 $(if $3,"projects=$3")))

