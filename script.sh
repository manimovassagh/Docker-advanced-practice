#!/bin/bash

# Step 1: Get the Docker image name from user input
read -p "Enter the name of the Docker image you want to pull and run: " IMAGE

# Step 2: Validate that the user input is not empty
if [[ -z "$IMAGE" ]]; then
    echo "Error: You must provide a Docker image name."
    exit 1
fi

# Step 3: Try to pull the Docker image
echo "Pulling the $IMAGE image..."
if ! docker pull "$IMAGE"; then
    echo "Error: Failed to pull the Docker image '$IMAGE'. Please check if the image exists or if you have access to it."
    exit 1
fi

# Set container name based on the image name, replacing invalid characters
CONTAINER_NAME="${IMAGE//[^a-zA-Z0-9_-]/_}-container"

# Step 4: Run the Docker container
echo "Running the $IMAGE container with the name $CONTAINER_NAME..."
if ! docker run --name "$CONTAINER_NAME" "$IMAGE"; then
    echo "Error: Failed to run the Docker container. Please check if the image is valid or if the container is running properly."
    exit 1
fi

# Step 5: Check if the container exists
container_id=$(docker ps -a -q --filter "name=$CONTAINER_NAME")

if [ -n "$container_id" ]; then
    echo "Container $CONTAINER_NAME exists."

    # Step 6: Stop and remove the container
    echo "Stopping container $CONTAINER_NAME..."
    docker stop "$CONTAINER_NAME" > /dev/null

    echo "Removing container $CONTAINER_NAME..."
    docker rm "$CONTAINER_NAME" > /dev/null
else
    echo "Error: Container $CONTAINER_NAME does not exist or failed to start."
    exit 1
fi

# Step 7: Remove the Docker image
echo "Removing the $IMAGE image..."
if ! docker rmi "$IMAGE"; then
    echo "Error: Failed to remove the Docker image '$IMAGE'."
    exit 1
fi

# Step 8: Remove dangling volumes
echo "Removing any dangling volumes..."
docker volume prune -f

echo "Process completed."
