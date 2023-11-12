#!/bin/bash

# Define the container name
container_name="my-django-container"
# Define the image name
image_name="my-django-app"
version="v1.0"  # Specify the desired version

# Define the location of your local db.sqlite3 file
local_db_path="C:\Users\1\Desktop\DevConnect Django CICD project\Django-WebApp"

# Check if the container is already running
if [ "$(docker ps -q -f name=$container_name)" ]; then
  echo "The container is already running."
else
  # Check if the image exists
  if [ "$(docker images -q $image_name:$version)" ]; then
    # Run the Docker container using the existing image
    docker run -d -p 8000:8000 --name $container_name -v my_db_volume:/app/ $image_name:$version
    echo "Django container started with an existing image."
  else
    # Build the Docker image
    docker build -t $image_name:$version .
    
    # Create the volume for the database
    docker volume create my_db_volume
    
    # Run the Docker container and start it with the local db.sqlite3 file copied to the volume
    docker run -d -p 8000:8000 --name $container_name -v my_db_volume:/app/ $image_name:$version
    echo "Django container started with a new image and the local db.sqlite3 file copied to the volume."
  fi
fi
