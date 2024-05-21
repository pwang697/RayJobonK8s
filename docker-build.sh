#!/bin/bash
set -e
# get requirements from ray repo
rm -rf python
git clone https://github.com/ray-project/ray.git
cp ray/python/*requirements.txt ./python 
cp ray/python/requirements/ml/*requirements.txt ./python/requirements/ml
cp ray/python/requirements/docker/*requirements.txt ./python/requirements/docker
cp ray/python/*requirements_compiled.txt ./python
rm -rf ray
#Build and push docker image
RAY_VERSION=2.22.0
docker build --build-arg BASE_IMAGE=$RAY_VERSION --progress=plain --tag registry.service.consul:4443/ray-ml:$RAY_VERSION .
docker push registry.service.consul:4443/ray-ml:$RAY_VERSION