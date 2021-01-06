ifeq ($(SSH), backoffice-admin)
	CONTAINER_NAME = fluentd
else
	CONTAINER_NAME = fluent-bit
endif

include ./variables.mk
include ./commands.mk

.PHONY: build
build:
	docker -H $(SSH_URI) build -t $(IMAGE_NAME) $(CONTAINER_NAME)/

.PHONY: stack-deploy
stack-deploy:
	$(shell cat $(CONTAINER_NAME)/.env) docker -H $(SSH_URI) stack deploy -c $(CONTAINER_NAME)/docker-compose.yml swarm

.PHONY: service-logs
service-logs:
	docker -H $(SSH_URI) service logs -f $(SWARM_NAME)

.PHONY: rebuild-deploy
rebuild-deploy:
	make -e SSH=$(SSH) service-rm
	sleep 10
	make -e SSH=$(SSH) rmi
	make -e SSH=$(SSH) build
	make -e SSH=$(SSH) stack-deploy
