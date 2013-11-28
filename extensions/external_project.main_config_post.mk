
EXTERNAL_TARGETS := $(foreach PROD,$(EXTERNAL_PRODUCTS), $(call product_target,$(PROD)))

.PHONY: $(EXTERNAL_TARGETS)
$(EXTERNAL_TARGETS): %:
	$(CMD_MESSAGE) "external product <$(EXTERNAL_PROJECT_PRODUCT)> (in project $(EXTERNAL_PROJECT_DIR))"
	$(CMD_PREFIX)make -C $(EXTERNAL_PROJECT_DIR) $(EXTERNAL_PROJECT_OPTIONS) products=$(EXTERNAL_PROJECT_PRODUCT)

