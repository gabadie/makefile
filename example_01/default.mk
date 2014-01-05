
EXAMPLE_PRODUCT := $(call product_create,BINEXEC,opencl_demo)
EXAMPLE_TARGET = $(call product_target,$(EXAMPLE_PRODUCT))
$(call product_public,$(EXAMPLE_PRODUCT))

$(EXAMPLE_TARGET): $$(call bin_object_files,$(call rfindall,cpp))
$(EXAMPLE_TARGET): BINEXEC_FLAGS = $(call bin_officiallib,opencl)

EXAMPLE_TEST := $(call test_product,$(EXAMPLE_PRODUCT))

