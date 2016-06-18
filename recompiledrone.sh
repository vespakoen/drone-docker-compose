#!/bin/bash

cd drone
export GO15VENDOREXPERIMENT=1
make deps     # Get dependencies
make gen     # Generate code
make build   # Build the binary
cd ..
