
#
# @infos: creates a product
#
# @uses:
#   $(call product_create,$(TARGET_TYPE),$(PRODUCT_NAME))
#
# @example:
#   $(call product_create,EXEC,hello_hex)
#
product_create = $2 $(\
    $(eval PRODUCT_$2_TYPE := $1) \
    $(eval PRODUCT_$2_TARGET := $(BUILD_PRODUCT_DIR)$2$($1_EXTENSION)) \
    $(eval PRODUCT_$2_PROJECT_DIR := $(PROJECT_DIR)) \
    $(eval PRODUCT_$2_DEPENDENCIES :=) \
    $(eval $1_PRODUCTS += $2) \
    $(eval PROJECT_PRODUCTS += $2) \
)

#
# @infos: fetches an external product
#
# @uses:
#   $(call product_external,$(EXTERNAL_PROJECT_DIR),$(PRODUCT_NAME),$(OPTIONS))
#
# @example:
#   $(call product_external,../hello_project/,lib_hello,config=default)
#
product_external = $2 $(\
    $(eval PRODUCT_$2_TYPE := EXTERNAL) \
    $(eval PRODUCT_$2_TARGET := $(call project_products,$1,$3,$2)) \
    $(eval PRODUCT_$2_PROJECT_DIR := $1) \
    $(eval PRODUCT_$2_DEPENDENCIES :=) \
    $(eval PRODUCT_$2_OPTIONS := $3) \
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
product_target = $(PRODUCT_$1_TARGET)

#
# @infos: sets a product's param
#
# @uses:
#   $(call product_set_param,$(PRODUCT_NAME),PARAM,$(VALUE))
#
# @example:
#   $(call product_set_param,hello_hex,C_FLAGS,-Werror)
#
product_set_param = $(eval PRODUCT_$1_PARAM_$2 = $3)

#
# @infos: adds a product's param
#
# @uses:
#   $(call product_append_param,$(PRODUCT_NAME),PARAM,$(VALUE))
#
# @example:
#   $(call product_append_param,hello_hex,C_FLAGS,-Werror)
#
product_append_param = $(eval PRODUCT_$1_PARAM_$2 += $3)

#
# @infos: appends a product's param
#
# @uses:
#   $(call product_param,$(PRODUCT_NAME),VARIABLE)
#
# @example:
#   $(call product_param,hello_hex,C_FLAGS)
#
product_param = $(PRODUCT_$1_PARAM_$2)

#
# @infos: adds product dependencies
#
# @uses:
#   $(call product_add_dependencies,$(PRODUCT_NAME),$(DEPENDENCIES))
#
# @example:
#   $(call product_add_dependencies,hello_hex,main.c)
#
product_add_dependencies = $(eval PRODUCT_$1_DEPENDENCIES += $2)

#
# @infos: gets a product's dependencies
#
# @uses:
#   $(call product_dependencies,$(PRODUCT_NAME))
#
# @example:
#   $(call product_dependencies,hello_hex)
#
product_dependencies = $(PRODUCT_$1_DEPENDENCIES)

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

