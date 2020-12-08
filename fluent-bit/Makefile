.PHONY: up
up:
	docker-compose -f docker-fluent-bit.yml up -d

.PHONY: rm
rm:
	docker rm -f fluent-bit
	docker rmi posicube/fluent-bit
