
BUILD_OBJ_DIR ?= $(BUILD_DIR)obj/

o_files = $(addprefix $(BUILD_OBJ_DIR),$(addsuffix .o,$(notdir $1)))

