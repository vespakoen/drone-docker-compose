#!/bin/bash

. ./env.sh

echo "Signing .drone.yml"
docker run --net drone -v $(pwd):/project --rm drone/drone:0.5 -t $DRONE_USER_TOKEN -s http://drone:8000 sign vespakoen/drone-docker-compose --in "/project/.drone.yml" --out "/project/.drone.yml.sig"
