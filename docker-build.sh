#!/bin/bash
set -e
#Build and push docker image
RAY_VERSION=2.12.0
docker build --build-arg BASE_IMAGE=$RAY_VERSION --progress=plain --tag registry.service.consul:4443/ray-ml:$RAY_VERSION .
docker push registry.service.consul:4443/ray-ml:$RAY_VERSION