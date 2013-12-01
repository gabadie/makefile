
HELLO_WORLD_LIB := $(call project_product,../example_bin_staticlib/,example_bin_staticlib)

GLOBAL_DEPENDENCIES := $(call product_target,$(HELLO_WORLD_LIB))
GLOBAL_CPP_FLAGS := $(call project_build_include_dir,../example_bin_staticlib/)

include ../quick_configs/bin_common.mk

