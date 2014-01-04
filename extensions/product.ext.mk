
ifeq ($(extension_entry),/config/pre)

#
# @infos: creates a product
#
# @uses:
#   $(call product_create,$(TARGET_TYPE),$(PRODUCT_NAME))
#
# @example:
#   $(call product_create,EXEC,hello_hex)
#
product_create = $2 \
    $(eval PRODUCT_$(strip $2)_TYPE :=$(strip $1)) \
    $(eval PRODUCT_$(strip $2)_PROJECT_DIR = $(PROJECT_DIR))\
    $(eval PRODUCT_$(strip $2)_TARGET = $(BUILD_PRODUCT_DIR)$(strip $2)$($(strip $1)_EXTENSION)) \
    $(eval $(strip $1)_PRODUCTS += $2) \
    $(eval PROJECT_PRODUCTS += $2) \
    $(foreach FUNCTION,$(PRODUCT_ENTRIES),$(call $(FUNCTION),$1,$2)) \

#
# @infos: gets a product's target
#
# @uses:
#   $(call product_target,$(PRODUCT_NAME))
#
# @example:
#   $(call product_target,hello_hex)
#
product_target = $(PRODUCT_$(strip $1)_TARGET)

#
# @infos: gets a product's type
#
# @uses:
#   $(call product_type,$(PRODUCT_NAME))
#
# @example:
#   $(call product_type,hello_hex)
#
product_type = $(PRODUCT_$(strip $1)_TYPE)

#
# @infos: makes a project public
#
# @uses:
#   $(call product_public,$(PRODUCT_NAME))
#
# @example:
#   $(call product_public,hello_hex)
#
product_public = $($(eval PROJECT_PUBLIC_PRODUCTS += $1))

#
# @infos: gets a product's project directory
#
# @uses:
#   $(call product_project_dir,$(PRODUCT_NAME))
#
# @example:
#   $(call product_project_dir,hello_hex)
#
product_project_dir = $(PRODUCT_$(strip $1)_PROJECT_DIR)

PROJECT_PUBLIC_PRODUCTS =

endif

ifeq ($(extension_entry),/config/post)

.PHONY: $(PLUMBING_PREFIX)list_products
$(PLUMBING_PREFIX)list_products:
	@$(foreach PUBLIC_PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),echo "$(PUBLIC_PRODUCT)";)

endif

