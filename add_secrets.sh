#!/bin/bash

. ./env.sh

function add_secret {
  docker run -v $(pwd):/project --rm drone/drone:0.5 -s http://localhost:8000 -t $DRONE_USER_TOKEN secret add --image=vespakoen/drone-docker:0.5.1 waffleapp/waffleDev $1 $2
}

function rm_secret {
  docker run -v $(pwd):/project --rm drone/drone:0.5 -s http://localhost:8000 -t $DRONE_USER_TOKEN secret rm waffleapp/waffleDev $1
}

rm_secret DOCKER_EMAIL
rm_secret DOCKER_REGISTRY
rm_secret DOCKER_USERNAME
rm_secret DOCKER_PASSWORD
add_secret DOCKER_EMAIL $DOCKER_REGISTRY_EMAIL
add_secret DOCKER_REGISTRY $DOCKER_REGISTRY_URL
add_secret DOCKER_USERNAME $DOCKER_REGISTRY_USERNAME
add_secret DOCKER_PASSWORD $DOCKER_REGISTRY_PASSWORD
