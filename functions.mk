
#
# @infos: recursively find files in a given dir
#
# @uses:
#   $(call rwildcard,$(DIR),$(MATCH))
#
# @param <DIR>: directory to search in
# @param <MARCH>: file match (ex: *.c)
#
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

#
# @infos: find a file in a current directory
#
# @uses:
#   $(call rfindall,$(MATCH))
#
# @param <MARCH>: file match (ex: *.c)
#
rfindall=$(call rwildcard,./,*.$1)

#
# @infos: removes doubles
#
# @uses:
#   $(call prunes_doubles,$(VARIABLES))
#
# @param <VARIABLES>: variables to removes doubles
#
prunes_doubles = $(if $1,$(firstword $1) $(filter-out $(firstword $1),$1))

#
# @infos: go to the parent dir
#
# @uses:
#   $(call url_parent_dir,$(DIR))
#
# @param <DIR>: the dir to go up
#
url_parent_dir=$(dir $(patsubst %/,%, $1))

#
# @infos: DO NOT USE.
#
private_url_find_parent=$(if $1,$(call private_url_find_parent,$(call url_parent_dir,$1),$2)$(wildcard $1$2))

#
# @infos: find all MATCH in all matches in parent dirs
#
# @uses:
#   $(call url_find_parent,$(DIR),$(MATCH))
#
# @param <DIR>: the starting dir
# @param <MARCH>: file match (ex: *.c)
#
url_find_parent=$(call private_url_find_parent,$(abspath $1)/,$2)

#
# @infos: getrelative apath from a basis and an absolute path
#
# @uses:
#   $(call url_relative,$(BASIS),$(ABS_PATH))
#
# @param <BASIS>: the path basis
# @param <ABS_PATH>: the absolute path
#
url_relative=$(shell (echo "import os"; echo "print os.path.relpath('$2', '$1') + '/'" ) | python)
