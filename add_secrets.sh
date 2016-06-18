#!/bin/bash

. ./env.sh

./release/linux/amd64/drone -t $DRONE_USER_TOKEN -s http://localhost:8000 secret add --image=docker vespakoen/drone-docker-compose DOCKER_REGISTRY $DOCKER_REGISTRY_URL
# ./release/linux/amd64/drone -t $DRONE_USER_TOKEN -s http://localhost:8000 secret add --image=docker vespakoen/drone-docker-compose DOCKER_USER $DOCKER_REGISTRY_USER
# ./release/linux/amd64/drone -t $DRONE_USER_TOKEN -s http://localhost:8000 secret add --image=docker vespakoen/drone-docker-compose DOCKER_PASSWORD $DOCKER_REGISTRY_PASSWORD
