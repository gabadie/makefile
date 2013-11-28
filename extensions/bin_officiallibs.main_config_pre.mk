
#
# @infos: get link flags for an offcial library
#
# @uses:
#   BINEXEC_FLAGS += $(call bin_officiallib,$(LIB_NAME))
#
# @example:
#   BINEXEC_FLAGS += $(call bin_officiallib,opencl)
#
bin_officiallib = $(BIN_OFFICIALLIB_$(strip $1))


BIN_OFFICIALLIB_opencl = $(if ($(OS_NAME),Darwin), -framework OpenCL, -lopencl)

