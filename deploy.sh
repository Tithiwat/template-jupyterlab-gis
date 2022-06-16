#!/bin/bash
VER=$(cat version.py)
docker-compose build
docker tag tithiwat/template-jupyterlab-gis tithiwat/template-jupyterlab-gis:$VERSION
docker push tithiwat/template-jupyterlab-gis:$VERSION
docker tag tithiwat/template-jupyterlab-gis:$VERSION tithiwat/template-jupyterlab-gis:latest
docker push tithiwat/template-jupyterlab-gis:latest