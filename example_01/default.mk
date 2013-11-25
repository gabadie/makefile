
EXAMPLE_TARGET = $(BUILD_PRODUCT_DIR)raytracer

EXEC_TARGETS += $(EXAMPLE_TARGET)

$(EXAMPLE_TARGET): $$(call o_files,$(call rfindall,cpp))

ifeq ($(OS_NAME),Darwin)
    OPENCL_LINK_FLAG = -framework OpenCL
else
    OPENCL_LINK_FLAG = -lopencl
endif

$(EXAMPLE_TARGET): LINK_EXEC_FLAGS = $(OPENCL_LINK_FLAG)

