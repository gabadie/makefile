
EXAMPLE_PRODUCT := $(call product_create,BINEXEC,opencl_demo)
EXAMPLE_TARGET = $(call product_target,$(EXAMPLE_PRODUCT))

ifeq ($(OS_NAME),Darwin)
    OPENCL_LINK_FLAG = -framework OpenCL
else
    OPENCL_LINK_FLAG = -lopencl
endif

$(EXAMPLE_TARGET): $$(call o_files,$(call rfindall,cpp))
$(EXAMPLE_TARGET): LINK_BINEXEC_FLAGS = $(OPENCL_LINK_FLAG)

