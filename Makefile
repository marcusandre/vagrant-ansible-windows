
VAGRANT ?= vagrant

boot:
	@$(VAGRANT) up --provision

.PHONY: boot
