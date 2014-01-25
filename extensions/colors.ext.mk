
ifeq ($(extension_entry),/config/pre)

COLOR_FG_DEFAULT=
COLOR_FG_BLACK=30
COLOR_FG_RED=31
COLOR_FG_GREEN=32
COLOR_FG_YELLOW=33
COLOR_FG_BLUE=34
COLOR_FG_PINK=35
COLOR_FG_CYAN=36
COLOR_FG_GREY=37

COLOR_PREFIX=\033[

COLOR_ERROR_FG=RED
COLOR_WARNING_FG=PINK
COLOR_TIME_FG=BLUE

#
# @infos: change text color
#
# @uses:
#   $(call color_text,$(COLOR))
#
# @example:
#   $(call color_text,RED)
#
color_text=$(COLOR_PREFIX)$(COLOR_FG_$(strip $1))m

#
# @infos: reset color
#
# @uses:
#   $(call color_reset)
#
color_reset=$(call color_text,DEFAULT)

#
# @infos: change color to the error color
#
# @uses:
#   $(call color_error)
#
color_error=$(call color_text,$(COLOR_ERROR_FG))

#
# @infos: change color to the warning color
#
# @uses:
#   $(call color_warning)
#
color_warning=$(call color_text,$(COLOR_WARNING_FG))

#
# @infos: change color to the time color
#
# @uses:
#   $(call color_time)
#
color_time=$(call color_text,$(COLOR_TIME_FG))

endif

