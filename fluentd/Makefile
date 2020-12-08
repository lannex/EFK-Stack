.PHONY: up
up:
	docker-compose -f docker-fluentd.yml up -d

.PHONY: rm
rm:
	docker rm -f fluentd
	docker rmi posicube/fluentd
