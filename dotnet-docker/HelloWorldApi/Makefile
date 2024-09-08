# Variables
DOCKER_USERNAME=manimovassagh
IMAGE_NAME=simpledotnet
TAG=latest

# Define default target (the first target that runs)
.PHONY: all
all: build push pull restart

# Build the Docker image
.PHONY: build
build:
	@echo "Building the Docker image..."
	docker build -t $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG) .

# Push the Docker image to Docker Hub
.PHONY: push
push: build
	@echo "Pushing the Docker image to Docker Hub..."
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)

# Pull the Docker image from Docker Hub
.PHONY: pull
pull:
	@echo "Pulling the Docker image from Docker Hub..."
	docker pull $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)

# Restart the Docker container using docker compose
.PHONY: restart
restart:
	@echo "Restarting the Docker container..."
	docker compose down
	docker compose up -d

# Clean up (remove old images)
.PHONY: clean
clean:
	@echo "Removing old Docker images..."
	docker rmi $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)
	