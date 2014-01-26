
ifeq ($(extension_entry),/config/pre)

#
# @infos: fetches files lists
#
# @uses:
#   $(call filelist,$(FILE_LIST_PATHS))
#
# @param <FILE_LIST_PATHS>: paths to file lists relatively to the project directory
#
# @example:
#   $(call filelist,directory/my_file.flist)
#
filelist = \
    $(foreach FILELIST,$(addprefix $(PROJECT_DIR),$1), \
        $(wildcard \
            $(addprefix $(dir $(FILELIST)), \
                $(shell sed '/^\#/d' $(FILELIST)) \
            ) \
        ) \
    )

endif

