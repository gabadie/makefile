
EXAMPLE_PRODUCT := $(call product_create,EXEC,opencl_demo)
EXAMPLE_TARGET = $(call product_target,$(EXAMPLE_PRODUCT))

ifeq ($(OS_NAME),Darwin)
    OPENCL_LINK_FLAG = -framework OpenCL
else
    OPENCL_LINK_FLAG = -lopencl
endif

$(EXAMPLE_TARGET): $$(call o_files,$(call rfindall,cpp))
$(EXAMPLE_TARGET): LINK_EXEC_FLAGS = $(OPENCL_LINK_FLAG)

