#!/bin/bash

. ./env.sh

echo "Signing .drone.yml"
docker run -v $(pwd):/project --rm drone/drone:0.5 -t $DRONE_USER_TOKEN -s http://localhost:8000 sign vespakoen/drone-docker-compose --in "/project/.drone.yml" --out "/project/.drone.yml.sig"
