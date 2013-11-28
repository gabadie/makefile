
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

#
# @infos: get link flags for several offcial libraries
#
# @uses:
#   BINEXEC_FLAGS += $(call bin_officiallibs,$(LIB_NAMES))
#
# @example:
#   BINEXEC_FLAGS += $(call bin_officiallibs,opencl opengl)
#
bin_officiallibs = $(foreach LIB_NAME,$1,$(call bin_officiallib,$(LIB_NAME)))


BIN_OFFICIALLIB_opencl = $(if ($(OS_NAME),Darwin), -framework OpenCL, -lopencl)

