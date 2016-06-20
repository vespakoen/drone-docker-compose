#!/bin/bash

. ./env.sh

if [ "$1" == "--rebuild-drone" ]; then
  ./recompiledrone.sh
  docker-compose stop
  docker-compose build
elif [ "$1" == "--rebuild-drone-docker" ]; then
  ./recompiledronedocker.sh
  docker-compose stop
  docker-compose build
else
  docker-compose stop
fi
docker-compose up -d
./add_secrets.sh
docker-compose logs -f
