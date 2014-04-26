
ifeq ($(extension_entry),/config/pre)

#
# @infos: constant defining where the test APIs' directory is
#
test_apis_dir := $(MK_DIR)test_apis

endif

ifeq ($(extension_entry),/config/post)

#
# @infos: runs test/update as a parallel target
#
.PHONY: test/update
$(call parallel_targets,test/update)

endif

ifeq ($(extension_entry),/linear)

#
# Command test/clean
#
.PHONY: test/clean
test/clean:
	$(CMD_RM) -rf $(_TEST_LOG_TARGETS)

#
# Command test/full
#
.PHONY: test/full
test/full: test/clean test/update
	$(CMD_IDLE)

#
# Shortcut test/update as tests
#
.PHONY: tests
tests: test/update
	$(CMD_IDLE)

endif

ifeq ($(extension_entry),/parallel)

test/update: $$(_TEST_LOG_TARGETS)
	$(CMD_IDLE)

endif
