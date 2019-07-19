#!/usr/bin/env bash

TAG=${1:-latest}
image="jayeve/pybox:$TAG"
docker build --no-cache -t $image .
docker push $image
