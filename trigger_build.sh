#!/bin/bash

echo "Enter a commit message or [enter] for auto message."
read commit_message
echo $(expr $(cat .build) + 1) > .build
./sign_yaml.sh
git add .
if [ ! -z "$commit_message" ]; then
  git commit -am "$commit_message"
else
  git commit -am "Trigger build #$(cat .build)"
fi
git push origin master
echo "Waiting for log to complete, hit enter when done."
read _
./log.sh > .log
docker-compose logs > .compose-log
git add .
git commit -am "Updating log"
git push origin master
