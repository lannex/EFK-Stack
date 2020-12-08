.PHONY: compose-up
compose-up:
	docker-compose -f docker-fluent-bit.yml up -d

.PHONY: compose-rm
compose-rm:
	docker rm -f fluent-bit
	docker rmi posicube/fluent-bit
	docker network rm fluent-bit_private_net

.PHONY: stack-deploy
stack-deploy:
	docker stack deploy -c docker-fluent-bit.yml swarm

.PHONY: service-rm
service-rm:
	docker service rm swarm_fluent-bit
