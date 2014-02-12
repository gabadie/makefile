
MAN_PRODUCT := $(call product_create,LATEXPDF,man)
MAN_TARGET := $(call product_target,$(MAN_PRODUCT))
$(call product_public,$(MAN_PRODUCT))

$(MAN_TARGET): man_*.tex
$(MAN_TARGET): TEXFLAGS += man_main.tex

