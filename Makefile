ifeq ($(SSH), pcdev3)
	CONTAINER_NAME = fluent-bit
else ifeq ($(SSH), backoffice-admin)
	CONTAINER_NAME = fluentd
endif

SSH_URI = ssh://$(SSH)
IMAGE_NAME = posicube/$(CONTAINER_NAME)
SWARM_NAME = swarm_$(CONTAINER_NAME)

.PHONY: build
build:
	docker -H $(SSH_URI) build -t $(IMAGE_NAME) .

.PHONY: rmi
rmi:
	docker -H $(SSH_URI) rmi $(IMAGE_NAME)

.PHONY: rm
rm:
	docker -H $(SSH_URI) rm -f $(CONTAINER_NAME)

.PHONY: ps
ps:
	docker -H $(SSH_URI) ps

.PHONY: compose-up
compose-up:
	docker-compose -H $(SSH_URI) up -d

.PHONY: stack-deploy
stack-deploy:
	$(shell cat $(CONTAINER_NAME)/.env) docker -H $(SSH_URI) stack deploy -c $(CONTAINER_NAME)/docker-compose.yml swarm

.PHONY: service-ls
service-ls:
	docker -H $(SSH_URI) service ls

.PHONY: service-rm
service-rm:
	docker -H $(SSH_URI) service rm $(SWARM_NAME)

.PHONY: service-logs
service-logs:
	docker -H $(SSH_URI) service logs -f $(SWARM_NAME)
