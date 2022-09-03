#!/bin/bash

VERSION=$(cat version.py)
CONTAINER_NAME="tithiwat/template-jupyterlab-gis"
# docker-compose build
# docker tag ${CONTAINER_NAME} tithiwat/template-jupyterlab-gis:$VERSION
# # docker push ${CONTAINER_NAME}:$VERSION
# docker tag ${CONTAINER_NAME}:$VERSION ${CONTAINER_NAME}:latest
# docker push ${CONTAINER_NAME}:latest


if [ "$1" == "deploy" ]; then
    if [[ $(uname -m) == 'arm64' ]]; then
        echo M1 deploy
        docker buildx build --platform linux/arm64 -t ${CONTAINER_NAME}:${VERSION} --push .
    else
        docker buildx build --platform linux/amd64 -t ${CONTAINER_NAME}:${VERSION} --push.
    fi

else

    if [[ $(uname -m) == 'arm64' ]]; then
        echo M1
        docker buildx build --platform linux/arm64 -t ${CONTAINER_NAME}:${VERSION} .
    else
        docker buildx build --platform linux/amd64 -t ${CONTAINER_NAME}:${VERSION} .
    fi
fi

# docker buildx build --platform linux/amd64,linux/arm64 -t my.registry/image-name:tag --push .

