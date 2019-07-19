#!/usr/bin/env bash

TAG=${1:-latest}
image="jayeve/rustbox:$TAG"
docker build  -t $image .
#docker push $image
