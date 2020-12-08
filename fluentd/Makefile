.PHONY: compose-up
compose-up:
	docker-compose -f docker-fluentd.yml up -d

.PHONY: compose-rm
compose-rm:
	docker rm -f fluentd
	docker rmi posicube/fluentd
	docker network rm fluentd_private_net

.PHONY: stack-deploy
stack-deploy:
	docker stack deploy -c docker-fluentd.yml swarm

.PHONY: service-rm
service-rm:
	docker service rm swarm_fluentd
