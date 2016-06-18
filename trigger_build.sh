#!/bin/bash

echo "Enter a commit message or [enter] for auto message."
read commit_message
echo $(expr $(cat .build) + 1) > .build
git add .
if [ ! -z "$commit_message" ]; then
  git commit -am "$commit_message"
else
  git commit -am "Trigger build #$(cat .build)"
fi
git push origin master
