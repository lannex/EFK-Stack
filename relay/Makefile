CONTAINER_NAME=fluent-relay

include ../variables.mk
include ../commands.mk

.PHONY: build
build:
	docker -H $(SSH_URI) build -t $(IMAGE_NAME) .

.PHONY: run
run:
	docker -H $(SSH_URI) run -d \
	--name $(CONTAINER_NAME) \
	--env-file .env \
	-p $(FLUENT_BIT_PORT) \
	-v $(FLUENT_BIT_VOLUMES1) \
	-v $(FLUENT_BIT_VOLUMES2) \
	-v $(FLUENT_BIT_VOLUMES3) \
	$(IMAGE_NAME)

.PHONY: stack-deploy
stack-deploy:
	$(shell cat .env) docker -H $(SSH_URI) stack deploy -c docker-compose.yml swarm
