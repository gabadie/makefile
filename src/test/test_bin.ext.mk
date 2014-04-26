
ifeq ($(extension_entry),/config/pre)

#
# @infos: Defines a C/CPP test and returns its target
#
# @uses:
#   $(call test_bin,$(SRC_FILE_PATH))
#
# @example:
#   TEST_TARGET := $(call test_c,test1.c)
#   TEST_TARGET := $(call test_c,test1.cpp)
#
test_bin = \
    $(eval _TEST_CCPP_PRODUCT := $(call product_create,BINEXEC,$(notdir $(1:$(suffix $1)=)))) \
    $(eval _TEST_CCPP_TARGET := $(call product_target,$(_TEST_CCPP_PRODUCT))) \
    $(eval $(_TEST_CCPP_TARGET): $(call bin_object_files,$1)) \
    $(eval $(_TEST_CCPP_TARGET): LDFLAGS += $(call bin_object_files,$1)) \
    $(eval $($(call test_product,$(_TEST_CCPP_PRODUCT)))) \
	$(_TEST_CCPP_TARGET)

#
# @infos: Defines C/CPP tests and returns theirs targets
#
# @uses:
#   $(call test_bins,$(SRC_FILE_PATH))
#
# @example:
#   TEST_TARGETS := $(call test_bins,test1.c test2.c test3.cpp)
#
test_bins = \
	$(foreach TEST,$1, \
		$(call test_bin,$(TEST)) \
	)


endif
