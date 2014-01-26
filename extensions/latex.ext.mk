
ifeq ($(extension_entry),/config/pre)

#
# @infos: create a product's target
#
# @caution: do not use it as is, it is automatically called in product_create
#
LATEXPDF_create_target = \
    $(BUILD_PRODUCT_DIR)$(strip $1).pdf

#
# @infos: gets the running invocation command
#
# @caution: do not use it as is, Consider to use product_run_cmd
#
LATEXPDF_run_cmd = open $(strip $(call product_target,$1))

#
# @infos: Lets product_create be able to create a LATEXPDF product
#
MK_KNOWN_PRODUCT_TYPES += LATEXPDF

LATEX_BUILD_FLAGS += -interaction=nonstopmode -file-line-error

endif

ifeq ($(extension_entry),/config/post)

LATEXPDF_TARGETS := $(foreach PROD,$(LATEXPDF_PRODUCTS), $(call product_target,$(PROD)))

$(foreach PRODUCT,$(LATEXPDF_PRODUCTS), \
    $(eval $(call product_target,$(PRODUCT)): LATEXPDF_TMP_DIR = $(call product_tmp_dir,$(PRODUCT))) \
    $(eval $(call product_target,$(PRODUCT)): LATEXPDF_STD = $(call product_tmp_dir,$(PRODUCT))$(strip $(PRODUCT)).stdout) \
)


$(LATEXPDF_TARGETS): %: $$(TEXDEPS)
	$(call history_rule,building latex stage 1,$@)
	$(CMD_MKDIR_ALL) $(dir $@) $(LATEXPDF_TMP_DIR)
	@pdflatex $(LATEX_BUILD_FLAGS) -output-directory $(LATEXPDF_TMP_DIR) $(TEXFLAGS) &> "$(LATEXPDF_STD)" ;\
	STATUS=$$? ;\
	if [ $$STATUS -ne 0 ]; then\
		cat $(LATEXPDF_STD) ;\
                exit $$STATUS ;\
	fi;
	$(if $(filter -glossary,$(TEXOPTIONS)), \
	    $(call history_rule,building latex glossay,$@) \
            $(shell makeglossaries "$(<:.tex=)" > $@.stdout 2> $@.stderr ;\
                STATUS=$$? ;\
                if [ $$STATUS -ne 0 ]; then\
                    cat $(LATEXPDF_STD) ;\
                    exit $$STATUS ;\
                fi; \
            ) \
        )
	$(call history_rule,building latex stage 2,$@)
	@pdflatex $(LATEX_BUILD_FLAGS) -output-directory $(LATEXPDF_TMP_DIR) $(TEXFLAGS) &> "$(LATEXPDF_STD)" ;\
	STATUS=$$? ;\
	if [ $$STATUS -ne 0 ]; then\
		cat $(LATEXPDF_STD) ;\
                exit $$STATUS ;\
	fi;
	$(call history_rule,building latex stage 3,$@)
	@pdflatex $(LATEX_BUILD_FLAGS) -output-directory $(LATEXPDF_TMP_DIR) $(TEXFLAGS) &> "$(LATEXPDF_STD)" ;\
	STATUS=$$? ;\
	if [ $$STATUS -ne 0 ]; then\
		cat $(LATEXPDF_STD) ;\
                exit $$STATUS ;\
	fi;
	@mv $(strip $(LATEXPDF_TMP_DIR))$(strip $(TEXFLAGS:.tex=.pdf)) $@ ;
	@rm -rf $(LATEXPDF_TMP_DIR) ;

endif

