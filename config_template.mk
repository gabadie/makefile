
#
# Type: BINEXEC, BINSTATICLIB, BINHEADERS
#
PRODUCT_NAME := $(call product_create,BINEXEC,foo_bar)
PRODUCT_TARGET := $(call product_target,$(PRODUCT_NAME))

EXTERNAL_PRODUCT := $(call project_product,../foo_bar/,foo_bar_product)

$(PRODUCT_TARGET): C_FLAGS +=
$(PRODUCT_TARGET): CPP_FLAGS +=
$(PRODUCT_TARGET): S_FLAGS +=
$(PRODUCT_TARGET): BINEXEC_FLAGS +=
$(PRODUCT_TARGET): BINLIBSTATIC_FLAGS +=
$(PRODUCT_TARGET): $(call bin_object_files,$(call rfindall,cpp) $(call rfindall,c) $(call rfindall,s))
$(PRODUCT_TARGET): $(call product_target,$(EXTERNAL_PRODUCT))

$(call libheader_add,foo_bar.h)
$(call product_c_cpp_rec_include_dirs, $(PRODUCT_NAME), $(EXTERNAL_PRODUCT))

