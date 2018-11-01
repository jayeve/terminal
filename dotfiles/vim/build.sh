#!/usr/bin/env bash
set -e

TAG=${1:-latest}
image="jayeve/vimbox:$TAG"
docker build -t $image .
docker push $image
