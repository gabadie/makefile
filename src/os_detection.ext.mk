
ifeq ($(extension_entry),/config/pre)

# @infos: give the operating system name:
#
# @values:
#   - Windows
#   - Linux
#   - Darwin
OS_NAME :=

ifeq ($(OS),Windows_NT)
    OS_NAME :=Windows
else
    OS_NAME :=$(shell uname -s)
endif

endif

