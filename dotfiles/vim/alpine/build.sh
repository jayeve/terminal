#!/usr/bin/env bash
set -e

TAG=${1:-latest}
image="jayeve/alpine-vimbox:$TAG"
docker build --no-cache -t $image .
docker push $image
