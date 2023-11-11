# =======================
# make
# -----------------------
# make build
# make run
# ...
# =======================

# Set docker image name
IMAGE_NAME=chatpgt-samples
CONTAINER_NAME=chatpgt-samples-container

# Set default target(only `make` to run)
default: help

# Set help messages
help:
	@echo "Usage:"
	@echo "  make build       Build the Docker image."
	@echo "  make run         Run the Docker container."
	@echo "  make start       Start the Docker container."
	@echo "  make stop        Stop the Docker container."
	@echo "  make clean       Stop and remove the Docker container."
	@echo "  make rm          Remove the Docker container."
	@echo "  make rmi         Remove the Docker image."
	@echo "  make show        Show the Docker container."
	@echo "  make showi       Show the Docker images."

# Build docker image
build:
	docker build -t $(IMAGE_NAME):latest -f ./hack/jupyter/Dockerfile .

# Run docker container
run:
	docker run -it --name $(CONTAINER_NAME) \
	-p 8888:8888 \
    -v $(PWD)/samples:/code/samples \
    $(IMAGE_NAME):latest

# Start docker container
start:
	docker start $(CONTAINER_NAME)
	docker exec -it $(CONTAINER_NAME) /bin/bash

# Stop docker container
stop:
	docker stop $(CONTAINER_NAME)

# Remove docker container
rm:
	docker rm $(CONTAINER_NAME)

# Clean(stop & remove) docker container
clean: stop rm

# Delete docker image
rmi:
	docker rmi $(IMAGE_NAME):latest

show:
	docker ps -a

showi:
	docker images

.PHONY: default help build run start stop rm clean rmi show showi rmu rmiu
