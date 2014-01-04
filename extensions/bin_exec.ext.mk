
ifeq ($(extension_entry),/config/pre)

BINEXEC_EXTENSION =
RUN_PRODUCTS += $(BINEXEC_PRODUCTS)

endif

ifeq ($(extension_entry),/config/post)

BINEXEC_TARGETS := $(foreach PROD,$(BINEXEC_PRODUCTS), $(call product_target,$(PROD)))
BINEXEC_CMD = $(CMD_PREFIX)g++

$(BINEXEC_TARGETS): %:
	$(CMD_MESSAGE) "linking executable <$@>"
	$(CMD_MKDIR_ALL) $(dir $@)
	$(BINEXEC_CMD) $(BINEXEC_FLAGS) -o $@ $(filter %.o %.a %.c %.cpp %.s,$^)

endif

