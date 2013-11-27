
#
# @infos: creates a product
#
# @uses:
#   $(call product_create,$(TARGET_TYPE),$(PRODUCT_NAME))
#
# @example:
#   $(call product_create,EXEC,hello_hex)
#
product_create = $(strip $2) \
    $(eval PRODUCT_$(strip $2)_TYPE :=$(strip $1)) \
    $(eval PRODUCT_$(strip $2)_TARGET = $(BUILD_PRODUCT_DIR)$(strip $2)$($(strip $1)_EXTENSION)) \
    $(eval PRODUCT_$(strip $2)_PROJECT_DIR := $(PROJECT_DIR)) \
    $(eval PRODUCT_$(strip $2)_DEPENDENCIES :=) \
    $(eval $(strip $1)_PRODUCTS += $2) \
    $(eval PROJECT_PRODUCTS += $2) \

#
# @infos: fetches an external product
#
# @uses:
#   $(call product_external,$(EXTERNAL_PROJECT_DIR),$(PRODUCT_NAME),$(OPTIONS))
#
# @example:
#   $(call product_external,../hello_project/,lib_hello,config=default)
#
product_external = $(strip $2) $(\
    $(eval PRODUCT_$(strip $2)_TYPE :=EXTERNAL) \
    $(eval PRODUCT_$(strip $2)_TARGET := $(call project_products,$(strip $1),$(strip $3),$(strip $2))) \
    $(eval PRODUCT_$(strip $2)_PROJECT_DIR := $1) \
    $(eval PRODUCT_$(strip $2)_DEPENDENCIES :=) \
    $(eval PRODUCT_$(strip $2)_OPTIONS := $3) \
    $(eval EXTERNAL_PRODUCTS += $2) \
)

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
# @infos: sets a product's param
#
# @uses:
#   $(call product_set_param,$(PRODUCT_NAME),PARAM,$(VALUE))
#
# @example:
#   $(call product_set_param,hello_hex,C_FLAGS,-Werror)
#
product_set_param = $(eval PRODUCT_$(strip $1)_PARAM_$(strip $2) = $3)

#
# @infos: adds a product's param
#
# @uses:
#   $(call product_append_param,$(PRODUCT_NAME),PARAM,$(VALUE))
#
# @example:
#   $(call product_append_param,hello_hex,C_FLAGS,-Werror)
#
product_append_param = $(eval PRODUCT_$(strip $1)_PARAM_$(strip $2) += $3)

#
# @infos: appends a product's param
#
# @uses:
#   $(call product_param,$(PRODUCT_NAME),VARIABLE)
#
# @example:
#   $(call product_param,hello_hex,C_FLAGS)
#
product_param = $(PRODUCT_$(strip $1)_PARAM_$(strip $2))

#
# @infos: adds product dependencies
#
# @uses:
#   $(call product_add_dependencies,$(PRODUCT_NAME),$(DEPENDENCIES))
#
# @example:
#   $(call product_add_dependencies,hello_hex,main.c)
#
product_add_dependencies = $(eval PRODUCT_$(strip $1)_DEPENDENCIES += $2)

#
# @infos: gets a product's dependencies
#
# @uses:
#   $(call product_dependencies,$(PRODUCT_NAME))
#
# @example:
#   $(call product_dependencies,hello_hex)
#
product_dependencies = $(PRODUCT_$(strip $1)_DEPENDENCIES)

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

PROJECT_PUBLIC_PRODUCTS =

