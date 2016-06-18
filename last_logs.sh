#!/bin/bash

sqlite3 /drone/drone.sqlite "select log_data from logs order by log_id desc limit 1;" | jq .out
