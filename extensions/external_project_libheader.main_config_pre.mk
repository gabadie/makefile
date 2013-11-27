
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
project_libheaders_dir = $(addprefix -I $1,$(shell make -C $1 plumbing_include $2))

