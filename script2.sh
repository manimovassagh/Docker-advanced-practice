#!/bin/bash

# Function to check if Docker daemon is running
check_docker_daemon() {
    if ! docker info > /dev/null 2>&1; then
        echo "Error: Docker daemon is not running. Please start Docker and try again."
        exit 1
    fi
}

# Function to check if an image exists locally
check_image_exists_locally() {
    local image_name="$1"
    if docker images -q "$image_name" &> /dev/null; then
        return 0  # Image exists locally
    else
        return 1  # Image does not exist locally
    fi
}

# Function to attempt to pull an image from Docker Hub
pull_image_from_docker_hub() {
    local image_name="$1"
    if docker pull "$image_name"; then
        return 0  # Image pulled successfully
    else
        return 1  # Failed to pull the image
    fi
}

# Function to handle the Docker process
run_docker_image() {
    local image_name="$1"
    CONTAINER_NAME="${image_name//[^a-zA-Z0-9_-]/_}-container"

    echo "Running the $image_name container with the name $CONTAINER_NAME..."
    if ! docker run --name "$CONTAINER_NAME" "$image_name"; then
        echo "Error: Failed to run the Docker container. Please check if the image is valid or if the container is running properly."
        exit 1
    fi

    # Check if the container exists
    container_id=$(docker ps -a -q --filter "name=$CONTAINER_NAME")

    if [ -n "$container_id" ]; then
        echo "Container $CONTAINER_NAME exists."

        # Stop and remove the container
        echo "Stopping container $CONTAINER_NAME..."
        docker stop "$CONTAINER_NAME" > /dev/null

        echo "Removing container $CONTAINER_NAME..."
        docker rm "$CONTAINER_NAME" > /dev/null
    else
        echo "Error: Container $CONTAINER_NAME does not exist or failed to start."
        exit 1
    fi

    # Remove the Docker image
    echo "Removing the $image_name image..."
    if ! docker rmi "$image_name"; then
        echo "Error: Failed to remove the Docker image '$image_name'."
        exit 1
    fi

    # Remove dangling volumes
    echo "Removing any dangling volumes..."
    docker volume prune -f

    echo "Process completed."
}

# Main logic

# Step 1: Check if Docker daemon is running
check_docker_daemon

# Step 2: Get Docker Hub login credentials as arguments
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 <dockerhub-username> <dockerhub-password>"
    exit 1
fi

DOCKER_USER="$1"
DOCKER_PASSWORD="$2"

# Step 3: Docker login (only once)
echo "Logging into Docker Hub..."
if ! echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin; then
    echo "Error: Docker Hub login failed. Please check your credentials."
    exit 1
fi

# Step 4: Loop for image input and handling
while true; do

    # Get the Docker image name from user input
    read -p "Enter the name of the Docker image you want to pull and run: " IMAGE

    # Validate that the user input is not empty
    if [[ -z "$IMAGE" ]]; then
        echo "Error: You must provide a Docker image name."
        continue
    fi

    # Check if the Docker image exists locally
    echo "Checking if the $IMAGE image exists locally..."
    if check_image_exists_locally "$IMAGE"; then
        echo "Image $IMAGE found locally."
        run_docker_image "$IMAGE"
        break
    fi

    # Pull the Docker image from Docker Hub
    echo "Pulling the $IMAGE image from Docker Hub..."
    if pull_image_from_docker_hub "$IMAGE"; then
        echo "Image $IMAGE pulled successfully."
        run_docker_image "$IMAGE"
        break
    else
        echo "Error: The Docker image '$IMAGE' does not exist or you don't have access to it."
        read -p "Do you want to try with a different image? (y/n): " retry
        if [[ "$retry" != "y" ]]; then
            echo "Exiting..."
            exit 1
        fi
    fi

done
