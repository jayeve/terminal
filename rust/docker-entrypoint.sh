#!/bin/bash

#setup docker group based on hosts mount gid
echo "Adding hosts GID to docker system group"
# this only works if the docker group does not already exist
DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
USER=dev

if [ -S ${DOCKER_SOCKET} ]; then
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})

    #addgroup is distribution specific

    sudo addgroup --gid ${DOCKER_GID} ${DOCKER_GROUP}
    sudo adduser ${USER} ${DOCKER_GROUP}
fi
newgrp ${DOCKER_GROUP}
newgrp $(id -gn)

exec "$@"
