#!/bin/bash

echo $(expr $(cat .build) + 1) > .build
git add .
git commit -am "Trigger build #$(cat .build)"
git push --set-upstream origin master
