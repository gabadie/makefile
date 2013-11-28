
PLUMBING_BUILD_INCLUDE_DIR = $(PLUMBING_PREFIX)build_include_dir

#
# @infos: Gets project's lib headers directory
#
# @uses:
#   $(call project_libheaders_dir,$(EXTERN_PROJECT_DIR))
#   $(call project_libheaders_dir,$(EXTERN_PROJECT_DIR),$(OPTIONS))
#
# @param EXTERN_PROJECT_DIR: external project's dir
# @param OPTIONS: options (exemple: config=release)
#
project_build_include_dir = $(addprefix -I $1,$(shell make -C $1 $(PLUMBING_BUILD_INCLUDE_DIR) $2))

.PHONY: $(PLUMBING_BUILD_INCLUDE_DIR)
$(PLUMBING_BUILD_INCLUDE_DIR):
	@echo $(BUILD_INCLUDE_DIR)

