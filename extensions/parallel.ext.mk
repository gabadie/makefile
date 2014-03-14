
ifeq ($(extension_entry),/config/pre)

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

endif

ifeq ($(extension_entry),/linear)

#
# @infos: the number of available cores
#
_PARALLEL_CORES := $(shell python -c "import multiprocessing ; print multiprocessing.cpu_count()")

#
# @infos: defines parrallel rules
#
$(_PARALLEL_TARGETS): %:
	@$(MAKE) -f $(firstword $(MAKEFILE_LIST)) --jobs $(_PARALLEL_CORES) PROJECT_PARALLEL=true $(MK_SPREADING_PARAMETERS) $@

endif
