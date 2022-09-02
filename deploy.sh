#!/bin/bash
VERSION=$(cat version.py)
CONTAINER_NAME="tithiwat/template-jupyterlab-gis"
docker-compose build
docker tag ${CONTAINER_NAME} tithiwat/template-jupyterlab-gis:$VERSION
# docker push ${CONTAINER_NAME}:$VERSION
docker tag ${CONTAINER_NAME}:$VERSION ${CONTAINER_NAME}:latest
docker push ${CONTAINER_NAME}:latest
