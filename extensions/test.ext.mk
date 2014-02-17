
ifeq ($(extension_entry),/config/pre)

#
# @infos: constant defining where the test APIs' directory is
#
test_apis_dir := $(MK_DIR)test_apis


endif

ifeq ($(extension_entry),/config/post)

.PHONY: tests test/update
tests test/update: $$(TEST_LOG_TARGETS)
	$(CMD_IDLE)

.PHONY: test/clean
test/clean:
	$(CMD_RM) -rf $(TEST_LOG_TARGETS)

.PHONY: test/full
test/full: test/clean test/update
	$(CMD_IDLE)


endif
