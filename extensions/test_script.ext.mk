
ifeq ($(extension_entry),/config/pre)

#
# @infos: Generates test script's log path
#
# @uses:
#   $(call test_script_log_path,$(SCRIPT_PATH))
#
test_script_log_path = $(BUILD_LOG_DIR)test_$(notdir $1).log

#
# @infos: Defines a test script and returns its target
#
# @uses:
#   $(call test_script,$(TEST_SCRIPT_PATH),$(ENV))
#
# @example:
#   TEST_LOG := $(call test_product,tests/hello.sh,sh)
#   TEST_LOG := $(call test_product,tests/hello.py,python)
#
test_script = $(call test_script_log_path,$1) \
    $(eval _TEST_SCRIPT_LOG_TARGETS += $(call test_script_log_path,$1)) \
    $(eval $(call test_script_log_path,$1): $1) \
    $(eval $(call test_script_log_path,$1): TEST_SCRIPT_PATH = $1) \
    $(eval $(call test_script_log_path,$1): TEST_SCRIPT_ENV = $(call run_guess_env,$1,$2))

#
# @infos: Defines test scripts and returns their targets
#
# @uses:
#   $(call test_scripts,$(TEST_SCRIPTS_PATHS),$(ENV))
#
# @example:
#   TEST_LOGS := $(call test_product,tests/hello.sh tests/hello2.sh,sh)
#
test_scripts = \
	$(foreach TEST_SCRIPT,$1,$(call test_script,$(TEST_SCRIPT),$2))


endif

ifeq ($(extension_entry),/config/post)

_TEST_LOG_TARGETS += $(_TEST_SCRIPT_LOG_TARGETS)

$(_TEST_SCRIPT_LOG_TARGETS): %: $$(MK_DEPENDENCIES)
	$(CMD_MKDIR_ALL) $(dir $@)
	$(call history_colored_rule,testing $(strip $(TEST_SCRIPT_ENV)) script,$(TEST_SCRIPT_PATH),GREEN)
	$(CMD_PREFIX)$(call run_script_cmd,$(TEST_SCRIPT_PATH), $(TEST_SCRIPT_ENV)) $(TESTFLAGS) > $@ ; \
		RETURN=$$? ; \
        if [ $$RETURN -ne 0 ]; then \
            echo "$(call color_error)<$(TEST_SCRIPT_PATH)> has returned $$RETURN$(call color_reset)"; \
            cat $@ ; \
            rm -rf $@ ; \
            echo ; \
            exit 1; \
        fi;


endif
