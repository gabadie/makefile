
.PHONY: show/targets
show/targets:
	$(CMD_IDLE)
	@$(foreach TARGET,$(PROJECT_TARGETS),echo $(TARGET);)

