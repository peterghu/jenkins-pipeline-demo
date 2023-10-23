#!/bin/bash
docker network create jenkins
docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --add-host=host.docker.internal:host-gateway --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
docker build -t my-own-jenkins:latest dockerfiles/blueoceanjenkins/.
docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --add-host=host.docker.internal:host-gateway --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8099:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  my-own-jenkins:latest