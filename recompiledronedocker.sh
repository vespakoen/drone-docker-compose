#!/bin/bash

cd drone-docker
export GO15VENDOREXPERIMENT=1
export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0
go build -a -tags netgo
make docker
docker build --rm -t plugins/docker .
cd ..
