
ifeq ($(extension_entry),/config/pre)

#
# @infos: get curent time
#
# @uses:
#   $(call time_get)
#
time_get = $(shell (echo "import time" ; echo "print int(round(time.time() * 1000))") | python)

COMPILE_START_TIME := $(call time_get)

MK_SPREADING_PARAMETERS += COMPILE_START_TIME=$(COMPILE_START_TIME)

#
# @infos: get the command printing elapsed time
#
# @uses:
#   $(call time_print_elapsed_cmd, $(TIMESTAMP_START), $(TIMESTAMP_END))
#
time_print_elapsed_cmd = ( \
		echo "delta = ($2)-($1)" ; \
		echo "print '{:02}:{:02}.{:03}'.format(delta/60000, (delta/1000) % 60, delta % 1000)" \
	) | python

#
# @infos: get the command printing elapsed time
#
# @uses:
#   $(call time_print_elapsed_cmd, $(TIMESTAMP_FROM))
#
time_print_elapsed_since_cmd = ( \
		echo "import time" ; \
		echo "delta = int(round(time.time() * 1000))-($1)" ; \
		echo "print '{:02}:{:02}.{:03}'.format(delta/60000, (delta/1000) % 60, delta % 1000)" \
	) | python

#
# @infos: gets the formated elapsed time
#
# @uses:
#   $(call time_elapsed,$(DATE1),$(DATE2))
#
time_elapsed = $(shell $(call time_print_elapsed_cmd,$1,$2))

#
# @infos: gets the formated elapsed time since the begining
#
# @uses:
#   $(call time_since)
#
time_since = $(shell $(call time_print_elapsed_since_cmd,$(COMPILE_START_TIME)))

endif

