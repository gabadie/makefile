
HELLO_WORLD_LIB := $(call project_product,../example_bin_staticlib/,example_bin_staticlib)

GLOBAL_DEPENDENCIES := $(call product_target,$(HELLO_WORLD_LIB))

include ../quick_configs/bin_common.mk

$(call product_c_cpp_rec_include_dirs, $(PRODUCT_NAME), $(HELLO_WORLD_LIB))

