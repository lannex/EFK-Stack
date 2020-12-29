CONTAINER_NAME=fluent-relay
SSH_URI = ssh://$(SSH)
IMAGE_NAME = posicube/$(CONTAINER_NAME)
SWARM_NAME = swarm_$(CONTAINER_NAME)

.PHONY: build
build:
	docker -H $(SSH_URI) build -t $(IMAGE_NAME) .

.PHONY: stack-deploy
stack-deploy:
	$(shell cat .env) docker -H $(SSH_URI) stack deploy -c docker-compose.yml swarm

.PHONY: service-rm
service-rm:
	docker -H $(SSH_URI) service rm $(SWARM_NAME)
