
DOC_PRODUCT := $(call product_create,LATEXPDF,document)
DOC_TARGET := $(call product_target,$(DOC_PRODUCT))
$(call product_public,$(DOC_PRODUCT))

$(DOC_TARGET): document.tex
$(DOC_TARGET): TEXFLAGS += document.tex

