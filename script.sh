#!/bin/bash

# Function to print Docker images in a formatted table
print_images() {
    echo "----------------------------------------"
    echo "| REPOSITORY        | TAG      | IMAGE ID |"
    echo "----------------------------------------"
    docker images --format "| {{.Repository}}\t| {{.Tag}}\t| {{.ID}} |" | column -t -s $'\t'
    echo "----------------------------------------"
}

# Function to remove images with <none> tag
remove_none_tag_images() {
    echo "Removing images with <none> tag..."
    none_images=$(docker images --filter "dangling=true" -q)
    
    if [ -z "$none_images" ]; then
        echo "No images with <none> tag found."
    else
        docker rmi $none_images
        echo "Removed images with <none> tag."
    fi
}

# Main script
echo "Listing Docker images:"
print_images
echo ""

# Remove unnecessary images with <none> tag
remove_none_tag_images
