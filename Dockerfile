
FROM jenkins/jenkins:2.414.3-lts-jdk17

USER root



# Give jenkins access to docker

RUN groupadd -g 997 docker

RUN gpasswd -a jenkins docker



# Install docker

RUN apt-get update && apt-get install -y docker.io



# Install docker-compose

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose --insecure

RUN chmod +x /usr/local/bin/docker-compose



# Install Docker CLI

RUN apt-get update && \

    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \

    curl -fsSL https://get.docker.com | sh && \

    apt-get clean



# Install Google Cloud SDK

RUN apt-get update && apt-get install -y curl gnupg

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN apt-get update && apt-get install -y google-cloud-sdk


# Make sure the 'jenkins' user can run Docker commands

RUN usermod -aG docker jenkins


EXPOSE 8080

