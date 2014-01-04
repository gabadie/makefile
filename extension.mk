
#
# @infos: manually define an extension entry point
#
# @uses:
#   include $(call extension_manual_entry,$(ENTRY_NAME))
#
# @param ENTRY_NAME: extension entry will be *.ENTRY_NAME.mk
#
extension_manual_entry = $(wildcard $(GLOBAL_EXTENSION_DIR)*.$1.mk)

#
# @infos: automatic extension entry
#
# @uses:
#   include $(extension_entry)
#
# @assert: any other include has been done before in the extension
#
deprecated_extension_entry = $(call extension_manual_entry,$(firstword $(subst ., ,$(notdir $(lastword $(MAKEFILE_LIST))))))

