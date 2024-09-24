#!/bin/bash

# Step 1: Get the Docker image name from user input
read -p "Enter the name of the Docker image you want to pull and run: " IMAGE

# Set container name based on the image name
CONTAINER_NAME="${IMAGE}-container"

# Step 2: Pull the Docker image
echo "Pulling the $IMAGE image..."
docker pull $IMAGE

# Step 3: Run the Docker container
echo "Running the $IMAGE container..."
docker run --name $CONTAINER_NAME $IMAGE

# Step 4: Check if the container exists
container_id=$(docker ps -a -q --filter "name=$CONTAINER_NAME")

if [ -n "$container_id" ]; then
    echo "Container $CONTAINER_NAME exists."

    # Step 5: Stop and remove the container
    echo "Stopping container $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME

    echo "Removing container $CONTAINER_NAME..."
    docker rm $CONTAINER_NAME
else
    echo "Container $CONTAINER_NAME does not exist."
fi

# Step 6: Remove the Docker image
echo "Removing the $IMAGE image..."
docker rmi $IMAGE

# Step 7: Remove dangling volumes
echo "Removing any dangling volumes..."
docker volume prune -f

echo "Process completed."
