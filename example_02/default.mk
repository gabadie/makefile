
EXAMPLE_PRODUCT := $(call product_create,BINHEADERS,headers)
EXAMPLE_TARGET = $(call product_target,$(EXAMPLE_PRODUCT))

$(EXAMPLE_TARGET): $$(call bin_header_deps,header01.h)

