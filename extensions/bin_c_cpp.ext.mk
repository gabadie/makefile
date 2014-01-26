
ifeq ($(extension_entry),/config/pre)

$(call mkrepo_load_param,cc,gcc -c -x c)
$(call mkrepo_load_param,cxx,g++ -c -x c++)

STATS_EXTENSIONS += *.c *.cpp

endif

ifeq ($(extension_entry),/config/post)

$(BUILD_OBJ_DIR)%.c.o: $$(call rwildcard,./,*%.c) $$(MK_DEPENDENCIES) $$(CDEPS)
	$(call history_rule,compiling c file,$<)
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_PREFIX)$(cc) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $< $(CFLAGS)

$(BUILD_OBJ_DIR)%.cpp.o: $$(call rwildcard,./,*%.cpp) $$(MK_DEPENDENCIES) $$(CXXDEPS)
	$(call history_rule,compiling c++ file,$<)
	$(CMD_MKDIR_ALL) $(BUILD_OBJ_DIR) $(BUILD_DEPS_DIR)
	$(CMD_PREFIX)$(cxx) -o $@ -MMD -MF $(patsubst %.o,%.d, $(BUILD_DEPS_DIR)$(notdir $@)) $< $(CXXFLAGS)

endif

