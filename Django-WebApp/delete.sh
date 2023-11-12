#!/bin/bash

# Define the Docker container name and volume name
CONTAINER_NAME="my-django-container"
VOLUME_NAME="my_app_volume"

# Stop the Docker container
docker stop $CONTAINER_NAME

# Remove the Docker container
docker rm $CONTAINER_NAME

# Check if you want to delete the volume (uncomment the line if needed)
# docker volume rm $VOLUME_NAME

echo "Container deleted."
