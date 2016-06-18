#!/bin/bash

. ./env.sh

function add_secret {
  ./release/linux/amd64/drone -t $DRONE_USER_TOKEN -s http://localhost:8000 secret add --image=vespakoen/drone-docker vespakoen/drone-docker-compose $1 $2
}

function rm_secret {
  ./release/linux/amd64/drone -t $DRONE_USER_TOKEN -s http://localhost:8000 secret rm vespakoen/drone-docker-compose $1
}

rm_secret DOCKER_EMAIL
rm_secret DOCKER_REGISTRY
rm_secret DOCKER_USERNAME
rm_secret DOCKER_PASSWORD
add_secret DOCKER_EMAIL $DOCKER_REGISTRY_EMAIL
add_secret DOCKER_REGISTRY $DOCKER_REGISTRY_URL
add_secret DOCKER_USERNAME $DOCKER_REGISTRY_USERNAME
add_secret DOCKER_PASSWORD $DOCKER_REGISTRY_PASSWORD
