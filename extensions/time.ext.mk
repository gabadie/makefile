
ifeq ($(extension_entry),/config/pre)

#
# @infos: get curent time
#
# @uses:
#   $(call time_get)
#
time_get = $(shell date +\(%j\*24\*60\*60+%H\*60\*60+%M\*60+%S\))

COMPILE_START_TIME := $(call time_get)

#
# @infos: gets the formated elapsed time
#
# @uses:
#   $(call time_elapsed,$(DATE1),$(DATE2))
#
time_elapsed = $(shell printf "%.3d:%.2d" "$(shell echo "($2 - $1)/60" | bc)" "$(shell echo "($2 - $1)%60" | bc)")

#
# @infos: gets the formated elapsed time since the begining
#
# @uses:
#   $(call time_since)
#
time_since = $(call time_elapsed,$(COMPILE_START_TIME),$(call time_get))

endif

