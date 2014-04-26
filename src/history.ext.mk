
ifeq ($(extension_entry),/config/pre)

#
# @infos: prints history for a rule
#
# @uses:
#   $(call history_rule,$(ACTION),$(RULE_TARGET))
#
# @example:
#   $(call history_rule,building C++,$<)
#
history_rule = $(call history_colored_rule,$1,$2,$(if $(SELF_PRODUCT_PUBLIC),,$(COLOR_PRIVATE_FG)))

#
# @infos: prints a colored history for a rule
#
# @uses:
#   $(call history_colored_rule,$(ACTION),$(RULE_TARGET),$(COLOR))
#
# @example:
#   $(call history_colored_rule,building C++,$<,BLUE)
#
history_colored_rule = @echo "\# $(color_time)`$(call time_print_elapsed_since_cmd,$(COMPILE_START_TIME))`$(color_reset)" $(message_indent) "$(call color_text,$3)$1" "<$(notdir $2)>$(color_reset)" ;

endif
