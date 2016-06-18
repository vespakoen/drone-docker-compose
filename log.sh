#!/bin/bash

if [ -z "$1" ]; then
  sqlite3 /drone/drone.sqlite "select log_data from logs order by log_id desc limit 1;" | jq --raw-output .out
else
  sqlite3 /drone/drone.sqlite "select log_data from logs where log_id = '$1';" | jq --raw-output .out
fi
