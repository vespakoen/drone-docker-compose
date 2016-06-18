#!/bin/bash

. ./env.sh

./release/linux/amd64/drone -t $DRONE_USER_TOKEN -s http://localhost:8000 sign vespakoen/drone-docker-compose
