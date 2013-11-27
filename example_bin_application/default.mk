
GLOBAL_CPP_FLAGS := $(call project_libheaders_dir,../example_bin_staticlib/)
GLOBAL_LINK_FLAGS := $(call project_products,../example_bin_staticlib/)

include ../config_templates/bin_application.mk

