
TEST_LOGS := $(foreach TEST,$(TEST_PRODUCTS), $(call test_log,$(TEST)))

$(TEST_LOGS):
	$(CMD_MKDIR_ALL) $(dir $@)
	$(CMD_PREFIX)./$< > $@
	$(CMD_MESSAGE) "testing product <$(strip $(TEST_PRODUCT))>"

.PHONY: tests
tests: $(TEST_LOGS)
	$(CMD_IDLE)

