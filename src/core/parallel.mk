
#
# @infos: Declares targets that are defined in /parrallel
#
# @uses:
#   $(call parallel_targets,$(TARGETS))
#
# @example:
#   $(call parallel_targets,test1.c)
#
parallel_targets = $(eval _PARALLEL_TARGETS += $1)
