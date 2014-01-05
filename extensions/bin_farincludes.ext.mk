
ifeq ($(extension_entry),/config/pre)

PLUMBING_PRODUCT_CCPP_INCLUDE_DIRS = $(PLUMBING_PREFIX)product_ccpp_include_dirs

#
# @infos: get product's include dirextories
#
# @uses:
#   $(call project_libheaders_dir,$(PRODUCT_NAME))
#
# @param PRODUCT_NAME: the product's name
#
product_c_cpp_include_dirs = \
    $(PRODUCT_$(strip $1)_CCPP_INCLUDEDIR)

#
# @infos: add C/C++ include dirs
#
# @uses:
#   $(call product_ccpp_include_dirs,$(PRODUCT_NAME),$(INCLUDE_DIRS))
#
# @param PRODUCT_NAME: the product's name
# @param INCLUDE_DIRS: include directories
#
product_c_cpp_add_include_dirs = \
    $(eval PRODUCT_$(strip $1)_CCPP_INCLUDEDIR += $2) \
    $(eval $(call product_target,$1): C_FLAGS += $(addprefix -I ,$2)) \
    $(eval $(call product_target,$1): CPP_FLAGS += $(addprefix -I ,$2))

#
# @infos: uses an external product's include path
#
# @uses:
#   $(call product_c_cpp_add_include_dirs,$(PRODUCT_NAME),$(EXTERNAL_PRODUCT))
#
# @param PRODUCT_NAME: the product's name
# @param EXTERNAL_PRODUCT: an external product's name
#
product_c_cpp_rec_include_dirs = \
    $(call product_c_cpp_add_include_dirs,$1,$(call product_c_cpp_include_dirs,$2))

#
# @infos: external product entry called by product_create
#
CCPP_INCLUDE_internal_product = \
    $(call product_c_cpp_add_include_dirs,$2,$(BUILD_INCLUDE_DIR))

PRODUCT_ENTRIES += CCPP_INCLUDE_internal_product

#
# @infos: external product entry called by project_product
#
CCPP_INCLUDE_external_product = \
    $(call product_c_cpp_add_include_dirs,$2,$(addprefix $1,$(shell make -C $1 $(PLUMBING_PRODUCT_CCPP_INCLUDE_DIRS))))

EXTERNAL_PRODUCT_ENTRIES += CCPP_INCLUDE_external_product


.PHONY: $(PLUMBING_PRODUCT_CCPP_INCLUDE_DIRS)
$(PLUMBING_PRODUCT_CCPP_INCLUDE_DIRS):
	$(CMD_IDLE) ; $(foreach PRODUCT,$(PROJECT_PRODUCTS_SELECTED), echo $(call product_c_cpp_include_dirs,$(PRODUCT)) ;)

endif

