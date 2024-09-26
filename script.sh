#!/bin/bash

# Function to validate if an image exists locally or remotely
check_image_exists() {
    local image_name="$1"
    docker pull "$image_name" &> /dev/null
    if [ $? -ne 0 ]; then
        return 1  # Image does not exist or is inaccessible
    else
        return 0  # Image exists
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

# Main logic with retry
while true; do
    # Step 1: Get the Docker image name from user input
    read -p "Enter the name of the Docker image you want to pull and run: " IMAGE

    # Step 2: Validate that the user input is not empty
    if [[ -z "$IMAGE" ]]; then
        echo "Error: You must provide a Docker image name."
        continue
    fi


    # Step 3: Check if the Docker image exists
    echo "Checking if the $IMAGE image exists..."
    if check_image_exists "$IMAGE"; then
        echo "Image $IMAGE found."
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
