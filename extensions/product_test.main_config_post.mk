
TEST_LOGS := $(foreach TEST,$(TEST_PRODUCTS), $(call test_log,$(TEST)))

$(TEST_LOGS):
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_MESSAGE) "testing product <$(strip $(TEST_PRODUCT))>"
	$(CMD_PREFIX)./$< > $@ ; \
	RETURN=$$? ; \
        FAILED_TEST=$$(sed -n '/^-/p' $@) ; \
        FAILED_TEST_COUNT=$$(echo "$$FAILED_TEST" | grep -c "^-") ; \
        if [ $$FAILED_TEST_COUNT -gt 0 ]; then \
            FAILED_TEST=$$(echo "$$FAILED_TEST" | cut -d " " -f 2-); \
            echo "\033[31m$$FAILED_TEST\033[m"; \
            echo ; \
            exit 1; \
        fi; \
        if [ $$RETURN -ne 0 ]; then \
            echo "<$<> has returned $$RETURN"; \
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

