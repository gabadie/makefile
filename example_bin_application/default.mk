
HELLO_WORLD_LIB := $(call project_product,../example_bin_staticlib/,example_bin_staticlib)

GLOBAL_DEPENDENCIES := $(call product_target,$(HELLO_WORLD_LIB))
GLOBAL_CPP_FLAGS := $(call project_libheaders_dir,../example_bin_staticlib/)

include ../config_templates/bin_common.mk

