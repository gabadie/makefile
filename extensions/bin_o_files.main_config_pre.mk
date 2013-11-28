
BUILD_OBJ_DIR ?= $(BUILD_DIR)objects/

o_files = $(addprefix $(BUILD_OBJ_DIR),$(addsuffix .o,$(notdir $1)))

