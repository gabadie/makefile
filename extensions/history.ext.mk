
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
history_rule = $(shell echo "\# \033[034m$(call time_since)\033[m" $(message_indent) "$1" "<$(notdir $2)>")

endif

