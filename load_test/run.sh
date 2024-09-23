#!/bin/bash

SCRIPT_PATH=$(dirname "$0")

# https://grafana.com/docs/k6/latest/get-started/running-k6/
docker run \
  --rm \
  -i \
  --name ecs-app-load-test \
  grafana/k6 run - <${SCRIPT_PATH}/index.js