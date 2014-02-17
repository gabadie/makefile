
ifeq ($(extension_entry),/config/pre)

#
# @infos: constant defining where the test APIs' directory is
#
test_apis_dir := $(MK_DIR)test_apis

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
    $(call product_assert_exist, test_product, $1)\
    $(if $(strip $(call product_run_cmd, $1)),,$(error $(strip $1): product type $(strip $(call product_type,$1)) is not executable))\
    $(eval TEST_PRODUCTS += $1) \
    $(eval TEST_$(strip $1)_LOG = $(BUILD_LOG_DIR)test_$(strip $1).log) \
    $(eval $(TEST_$(strip $1)_LOG): $(call product_target,$1)) \
    $(eval $(TEST_$(strip $1)_LOG): TEST_PRODUCT = $1)

#
# @infos: Tests severals products
#
# @uses:
#   $(call test_products,$(PRODUCT_NAMES))
#
# @example:
#   TEST_NAME := $(call test_products,$(PRODUCT1) $(PRODUCT2))
#
test_products = \
    $(foreach PRODUCT,$1, \
        $(call test_product,$(PRODUCT)) \
    )

#
# @infos: Gets a test's target log
#
# @uses:
#   $(call test_log,$(TEST_NAME))
#
test_log = $(TEST_$(strip $1)_LOG)

#
# @infos: Gets tests' target logs
#
# @uses:
#   $(call test_logs,$(TEST_NAMES))
#
test_logs = \
    $(foreach PRODUCT_NAME,$1,\
        $(call test_log,$(PRODUCT_NAME)) \
    )


TEST_PRODUCTS =

endif

ifeq ($(extension_entry),/config/post)

TEST_LOGS := $(foreach TEST,$(TEST_PRODUCTS), $(call test_log,$(TEST)))

$(TEST_LOGS):
	$(CMD_MKDIR_ALL) $(dir $@)
	$(call history_colored_rule,testing executable,$<,GREEN)
	$(CMD_PREFIX)$(call product_run_cmd,$(TEST_PRODUCT)) > $@ ; \
	RETURN=$$? ; \
        FAILED_TEST=$$(sed -n '/^-/p' $@) ; \
        FAILED_TEST_COUNT=$$(echo "$$FAILED_TEST" | grep -c "^-") ; \
        if [ $$FAILED_TEST_COUNT -gt 0 ]; then \
            FAILED_TEST=$$(echo "$$FAILED_TEST" | cut -d " " -f 2-); \
            echo "$(call color_error)$$FAILED_TEST$(call color_reset)"; \
            rm -rf $@ ; \
            echo ; \
            exit 1; \
        fi; \
        if [ $$RETURN -ne 0 ]; then \
            echo "$(call color_error)<$<> has returned $$RETURN$(call color_reset)"; \
            rm -rf $@ ; \
            echo ; \
            exit 1; \
        fi;

.PHONY: $(PLUMBING_PREFIX)removes_log
$(PLUMBING_PREFIX)removes_log:
	$(CMD_RM) -rf $(LOG_TO_REMOVE)

.PHONY: tests test/update
tests test/update: $(TEST_LOGS)
	$(CMD_IDLE)

.PHONY: $(addprefix test/product/,$(TEST_PRODUCTS))
$(foreach TEST_PRODUCT,$(TEST_PRODUCTS), \
    $(eval test/product/$(TEST_PRODUCT): $(call test_log,$(TEST_PRODUCT))) \
    $(eval test/product/$(TEST_PRODUCT): LOG_TO_REMOVE = $(call test_log,$(TEST_PRODUCT))) \
)
$(addprefix test/product/,$(TEST_PRODUCTS)): $(PLUMBING_PREFIX)removes_log
	$(CMD_IDLE)

.PHONY: test/full
test/full: $(addprefix test/product/,$(TEST_PRODUCTS))
	$(CMD_IDLE)

endif

