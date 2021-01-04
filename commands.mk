.PHONY: rm
rm:
	docker -H $(SSH_URI) rm -f $(CONTAINER_NAME)

.PHONY: ps
ps:
	docker -H $(SSH_URI) ps

.PHONY: rmi
rmi:
	docker -H $(SSH_URI) rmi $(IMAGE_NAME)

.PHONY: service-ls
service-ls:
	docker -H $(SSH_URI) service ls

.PHONY: service-rm
service-rm:
	docker -H $(SSH_URI) service rm $(SWARM_NAME)
