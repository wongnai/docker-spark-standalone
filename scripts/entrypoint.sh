#!/bin/bash

if [[ "$1" = "master" ]]; then
  shift;
  /opt/spark/docker-scripts/start-master-foreground.sh "$@"
elif [[ "$1" == "worker" ]]; then
  shift;
  /opt/spark/docker-scripts/start-slave-foreground.sh "$@"
else 
  exec "$@"
fi
