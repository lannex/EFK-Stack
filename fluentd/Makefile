IMAGE_NAME = posicube/fluentd
SWARM_NAME = swarm_fluentd
CONTAINER_NAME = fluentd

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: rmi
rmi:
	docker rmi $(IMAGE_NAME)

.PHONY: rm
rm:
	docker rm -f $(CONTAINER_NAME)

.PHONY: compose-up
compose-up:
	docker-compose up -d

.PHONY: stack-deploy
stack-deploy:
	$(shell cat .env) docker stack deploy -c docker-compose.yml swarm

.PHONY: service-rm
service-rm:
	docker service rm $(SWARM_NAME)
