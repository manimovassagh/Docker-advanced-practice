#!/bin/bash

IMAGE="ubuntu"
CONTAINER_NAME="ubuntu-container"

# Step 1: Pull the ubuntuimage
echo "Pulling the $IMAGE image..."
docker pull $IMAGE

# Step 2: Run the ubuntu container
echo "Running the $IMAGE container..."
docker run --name $CONTAINER_NAME $IMAGE

# Step 3: Check if the container exists
container_id=$(docker ps -a -q --filter "name=$CONTAINER_NAME")

if [ -n "$container_id" ]; then
    echo "Container $CONTAINER_NAME exists."

    # Step 4: Stop and remove the container
    echo "Stopping container $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME

    echo "Removing container $CONTAINER_NAME..."
    docker rm $CONTAINER_NAME
else
    echo "Container $CONTAINER_NAME does not exist."
fi

# Step 5: Remove the ubuntu image
echo "Removing the $IMAGE image..."
docker rmi $IMAGE

# Step 6: Remove dangling volumes
echo "Removing any dangling volumes..."
docker volume prune -f

echo "Process completed."
