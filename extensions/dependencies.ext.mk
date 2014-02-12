
ifeq ($(extension_entry),/config/pre)

BUILD_DEPS_DIR ?= $(BUILD_DIR)dependencies/

endif

ifeq ($(extension_entry),/config/post)

DEPENDENCY_FILES := $(abspath $(call rwildcard,$(BUILD_DEPS_DIR),*.d))

-include $(DEPENDENCY_FILES)

#
# Depency files are only files containing data. They don't have any makefile algorithms. Therefore we filter out them
# from MAKEFILE_LIST used in MK_DEPENDENCIES to avoid circular dependencies. Elsewhere it causes a bug rebuilding the
# whole project when two rules generating dependency files are built not excatly at the very same second.
#
$(eval MK_MAKEFILE_LIST_WITH_D_FILES := $(value MK_MAKEFILE_LIST))

MK_MAKEFILE_LIST = $(filter-out $(DEPENDENCY_FILES),$(abspath $(MK_MAKEFILE_LIST_WITH_D_FILES)))


endif
