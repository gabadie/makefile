
#
# @infos: return header dependencies
#
# @uses:
#   $(call bin_header_deps,$(MY_HEADER))
#
# @param <MY_HEADER>: path to the header file
#
bin_header_deps = $(filter-out /* ../* :,$(shell g++ -E -x c++-header -MM -MT "" "$1"))

