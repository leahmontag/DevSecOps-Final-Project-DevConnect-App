#!/bin/bash

# Define the image name and tag
#image_name="my-django-app"
#image_name="bug-fix-version"
#image_name="deconnectapp-img"
image_name="jenkins/jenkins"



#image_tag="v1.0"  # Replace with the desired image tag
#image_tag="v1.1"  # Replace with the desired image tag
image_tag="1.1"  # Replace with the desired image tag

# Tag the Docker image for Artifact Registry
artifact_registry_image="me-west1-docker.pkg.dev/devconnect-project/leah-montag-artifacts/$image_name:$image_tag"
docker tag "$image_name:$image_tag" "$artifact_registry_image"

# Push the Docker image to Artifact Registry using service account impersonation
gcloud auth login
gcloud auth configure-docker me-west1-docker.pkg.dev
docker push "$artifact_registry_image"

echo "Docker image $artifact_registry_image has been pushed to Artifact Registry."
