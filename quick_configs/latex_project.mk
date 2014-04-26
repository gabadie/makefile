
LATEX_PRODUCT := $(call product_create,LATEXPDF,man)
LATEX_TARGET := $(call product_target,$(LATEX_PRODUCT))
$(call product_public,$(LATEX_PRODUCT))

$(LATEX_TARGET): *.tex
$(LATEX_TARGET): TEXFLAGS += main.tex
