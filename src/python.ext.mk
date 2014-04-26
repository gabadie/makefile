
ifeq ($(extension_entry),/config/pre)

#
# @infos: create a product's target
#
# @caution: do not use it as is, it is automatically called in product_create
#
PYEXEC_create_target = \
    $2

#
# @infos: gets the running invocation command
#
# @caution: do not use it as is, Consider to use product_run_cmd
#
PYEXEC_run_cmd = python $(strip $(call product_target,$1))

#
# @infos: Lets product_create be able to create a PYEXEC product
#
MK_KNOWN_PRODUCT_TYPES += PYEXEC

endif

