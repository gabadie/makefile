
ifeq ($(extension_entry),/config/pre)

time_s = $(shell date +\(%j\*24\*60\*60+%H\*60\*60+%M\*60+%S\))

COMPILE_START_TIME := $(call time_s)

time_elapsed = $(shell printf "%.3d:%.2d" "$(shell echo "($2 - $1)/60" | bc)" "$(shell echo "($2 - $1)%60" | bc)")

time_since = $(call time_elapsed,$(COMPILE_START_TIME),$(call time_s))

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
history_colored_rule = $(shell echo "\# $(color_time)$(call time_since)$(color_reset)" $(message_indent) "$(call color_text,$3)$1" "<$(notdir $2)>$(color_reset)")

endif

