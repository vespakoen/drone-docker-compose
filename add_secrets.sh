#!/bin/bash

. ./env.sh

function add_secret {
  docker run --net dronedockercompose_default --rm drone/drone:0.5 -s http://drone:8000 -t $DRONE_USER_TOKEN secret add --image=$1 vespakoen/drone-docker-compose $2 $3
}

function rm_secret {
  docker run --net dronedockercompose_default --rm drone/drone:0.5 -s http://drone:8000 -t $DRONE_USER_TOKEN secret rm vespakoen/drone-docker-compose $1
}

rm_secret DOCKER_EMAIL
rm_secret DOCKER_REGISTRY
rm_secret DOCKER_USERNAME
rm_secret DOCKER_PASSWORD

rm_secret SFTP_CACHE_SERVER
rm_secret SFTP_CACHE_PATH
rm_secret SFTP_CACHE_PASSWORD
rm_secret SFTP_CACHE_USERNAME

add_secret vespakoen/drone-docker:0.5.1 DOCKER_EMAIL $DOCKER_REGISTRY_EMAIL
add_secret vespakoen/drone-docker:0.5.1 DOCKER_REGISTRY $DOCKER_REGISTRY_URL
add_secret vespakoen/drone-docker:0.5.1 DOCKER_USERNAME $DOCKER_REGISTRY_USERNAME
add_secret vespakoen/drone-docker:0.5.1 DOCKER_PASSWORD $DOCKER_REGISTRY_PASSWORD

add_secret plugins/sftp-cache:latest SFTP_CACHE_SERVER $SFTP_CACHE_SERVER
add_secret plugins/sftp-cache:latest SFTP_CACHE_PATH $SFTP_CACHE_PATH
add_secret plugins/sftp-cache:latest SFTP_CACHE_PASSWORD $SFTP_CACHE_PASSWORD
add_secret plugins/sftp-cache:latest SFTP_CACHE_USERNAME $SFTP_CACHE_USERNAME
