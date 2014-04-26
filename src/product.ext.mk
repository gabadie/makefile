
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
    $(if $(PRODUCT_$(strip $2)_TYPE), $(error product/<$(strip $2)> already exists))\
    $(if $(filter $(strip $1),$(MK_KNOWN_PRODUCT_TYPES)),, $(error product/<$(strip $2)>: unknown type $1 (must be one of: $(MK_KNOWN_PRODUCT_TYPES))))\
    $(eval PRODUCT_$(strip $2)_TYPE :=$(strip $1)) \
    $(eval PRODUCT_$(strip $2)_PROJECT_DIR := $(PROJECT_DIR))\
    $(eval PRODUCT_$(strip $2)_TARGET := $(call $(strip $1)_create_target,$2)) \
    $(eval PRODUCT_$(strip $2)_TARGET: SELF_PRODUCT = $2) \
    $(eval $(strip $1)_PRODUCTS += $2) \
    $(eval PROJECT_PRODUCTS += $2) \
    $(foreach FUNCTION,$(PRODUCT_ENTRIES),$(call $(FUNCTION),$1,$2)) \

#
# @infos: asserts that a given product is existing
#
# @uses:
#   $(call product_assert_exist,$(FUNCTION_NAME),$(PRODUCT_NAME))
#
product_assert_exist = \
    $(if $(PRODUCT_$(strip $2)_TYPE),,$(error $(strip $1): unknown product))\

#
# @infos: gets a product's target
#
# @uses:
#   $(call product_target,$(PRODUCT_NAME))
#
# @example:
#   $(call product_target,hello_hex)
#
product_target = \
    $(call product_assert_exist, product_target, $1)\
    $(PRODUCT_$(strip $1)_TARGET)

#
# @infos: gets products' targets
#
# @uses:
#   $(call product_targets,$(PRODUCT_NAMES))
#
product_targets = \
    $(foreach PRODUCT,$1,$(call product_target,$(PRODUCT)))

#
# @infos: sets a product's target
#
# @uses:
#   TARGET = $(call product_set_target,$(PRODUCT_NAME),$(PRODUCT_TARGET))
#
product_set_target = $2\
    $(call product_assert_exist, product_target, $1)\
    $(eval PRODUCT_$(strip $1)_TARGET = $2)

#
# @infos: gets a product's type
#
# @uses:
#   $(call product_type,$(PRODUCT_NAME))
#
# @example:
#   $(call product_type,hello_hex)
#
product_type = \
    $(call product_assert_exist, product_type, $1)\
    $(PRODUCT_$(strip $1)_TYPE)

#
# @infos: makes a project public
#
# @uses:
#   $(call product_public,$(PRODUCT_NAME))
#
# @example:
#   $(call product_public,hello_hex)
#
product_public = \
    $(call product_assert_exist, product_public, $1)\
    $(eval PROJECT_PUBLIC_PRODUCTS += $1)\
    $(eval $(call product_target,$1): SELF_PRODUCT_PUBLIC=true)

#
# @infos: gets a product temporay directory
#
# @uses:
#   $(call product_tmp_dir,$(PRODUCT_NAME))
#
product_tmp_dir = $(BUILD_DIR_DIR)$(strip $1)/\
    $(call product_assert_exist, product_tmp_dir, $1)

#
# @infos: gets a product's project directory
#
# @uses:
#   $(call product_project_dir,$(PRODUCT_NAME))
#
# @example:
#   $(call product_project_dir,hello_hex)
#
product_project_dir = \
    $(call product_assert_exist, product_project_dir, $1)\
    $(PRODUCT_$(strip $1)_PROJECT_DIR)

#
# @infos: gets the running invocation command
#
# @uses:
#   $(call product_run_cmd,$(PRODUCT_NAME))
#
product_run_cmd = \
    $(call product_assert_exist, product_run_cmd, $1)\
    $(call $(call product_type,$1)_run_cmd,$1)

#
# @infos: gets the openning invocation command
#
# @uses:
#   $(call product_open_cmd,$(PRODUCT_NAME))
#
product_open_cmd = \
    $(call product_assert_exist, product_open_cmd, $1)\
    $(call $(call product_type,$1)_open_cmd,$1)

#
# @infos: gets product of a given type
#
# @uses:
#   $(call product_type_list,$(PRODUCT_TYPE))
#
product_type_list = \
    $($(strip $1)_PRODUCTS)


PROJECT_PUBLIC_PRODUCTS =

endif

ifeq ($(extension_entry),/config/post)

.PHONY: $(PLUMBING_PREFIX)list_products
$(PLUMBING_PREFIX)list_products:
	@$(foreach PUBLIC_PRODUCT,$(PROJECT_PUBLIC_PRODUCTS),echo "$(PUBLIC_PRODUCT)";)

endif

