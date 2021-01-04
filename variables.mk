SSH_URI = ssh://$(SSH)
IMAGE_NAME = posicube/$(CONTAINER_NAME)
SWARM_NAME = swarm_$(CONTAINER_NAME)

FLUENT_BIT_PORT = 24224:24224
FLUENT_BIT_VOLUMES1 = /var/log:/rootfs/var/log:ro
FLUENT_BIT_VOLUMES2 = /var/lib/docker/containers:/var/lib/docker/containers:ro
FLUENT_BIT_VOLUMES3 = /var/run/docker.sock:/var/run/docker.sock
