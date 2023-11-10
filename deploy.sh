



image_name="jenkins/jenkins"
#image_tag="2.414.3-lts-jdk17"  

image_tag="2.6-lts-jdk17"  


# Tag the Docker image for Artifact Registry
artifact_registry_image="me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/$image_name:$image_tag"
docker tag "$image_name:$image_tag" "$artifact_registry_image"

# Push the Docker image to Artifact Registry using service account impersonation
gcloud auth login
gcloud auth configure-docker me-west1-docker.pkg.dev
docker push "$artifact_registry_image"
gcloud config set project devconnect-final-project




gcp_instance="leah-montag-jenkins" # Replace with your Google Cloud VM instance name
gcp_zone="us-central1-a" # Replace with your Google Cloud zone
artifact_image="me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/$image_name:$image_tag" # Replace with your Google Cloud Project ID and Artifact Registry image name



# Connect to the Google Cloud VM instance via SSH and execute the commands
gcloud compute ssh $gcp_instance --zone $gcp_zone --command \
    "docker pull me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/$image_name:$image_tag/ && \
     docker volume create jenkins-data  && \
     docker run -d -p 8080:8080 --name jenkins_container -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --memory=1g --memory-reservation=512m --cpus=1 me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/$image_name:$image_tag"


docker pull me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.5-lts-jdk17
docker run -d -p 8080:8080 --name jenkins_container -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.414.3-lts-jdk17

docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v jenkins-data:/var/jenkins_home me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.5-lts-jdk17

docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins-data:/var/jenkins_home me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.5-lts-jdk17



docker run -p 8080:8080 -v /path/on/host:/path/in/container me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.6-lts-jdk17


docker run -p 8080:8080 -v /path/on/host:/path/in/container me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.6-lts-jdk17

docker run -d --user=root -v jenkins_vol:/var/jenkins_home -v //var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --restart=on-failure --name jenkins jenkins/jenkins:2.6-lts-jdk17


docker run -p 8080:8080 -p 5000:5000 --name jenkins_container --user 0 --restart=on-failure -v //var/run/docker.sock:/var/run/docker.sock me-west1-docker.pkg.dev/devconnect-final-project/leah-montag-artifacts/jenkins/jenkins:2.6-lts-jdk17
