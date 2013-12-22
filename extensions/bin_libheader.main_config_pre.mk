
LIBHEADER_TARGETS =

BUILD_INCLUDE_DIR = $(BUILD_DIR)includes/

#
# @infos: return library header dependencies
#
# @uses:
#   $(call libheader_deps,$(MY_HEADER))
#
# @param <MY_HEADER>: path to the header file
#
libheader_deps = $(call bin_header_deps,$1)

#
# @infos: register library headers and its dependencies
#
# @uses:
#   $(call libheader_add,$(MY_HEADER))
#
# @param <MY_HEADER>: path to the header file
#
libheader_add = $(foreach DEP,$(call libheader_deps,$1), \
    $($(eval LIBHEADER_TARGETS += $(BUILD_INCLUDE_DIR)$(DEP))) \
)

