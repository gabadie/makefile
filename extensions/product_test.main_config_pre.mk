
#
# @infos: Tests a product
#
# @uses:
#   $(call test_product,$(PRODUCT_NAME))
#
# @example:
#   TEST_NAME := $(call test_product,hello_test_unit1)
#
test_product = $1 \
    $(eval TEST_PRODUCTS += $1) \
    $(eval TEST_$(strip $1)_LOG = $(BUILD_LOG_DIR)test_$(strip $1).log) \
    $(eval $(TEST_$(strip $1)_LOG): $(call product_target,$1)) \
    $(eval $(TEST_$(strip $1)_LOG): TEST_PRODUCT = $1)

#
# @infos: Gets a test's target log
#
# @uses:
#   $(call test_log,$(TEST_NAME))
#
test_log = $(TEST_$(strip $1)_LOG)

TEST_PRODUCTS =

