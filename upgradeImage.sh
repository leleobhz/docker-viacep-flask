#!/bin/bash -e

docker-compose rm -svf
docker-compose pull
docker-compose up --build --remove-orphans ${@}

