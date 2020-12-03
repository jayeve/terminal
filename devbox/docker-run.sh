#!/bin/bash
function get_docker_compose() {
  local base=$HOME
  if [ ! -f "$base/.devbox/$1/docker-compose.yml" ]; then
    echo "docker-compose for $1box doesn't exist. Pulling now..."
    curl --fail https://raw.githubusercontent.com/jayeve/terminal/master/devbox/$1/docker-compose.yml -o tmp && \
    mkdir -p $base/.devbox/$1 && mv tmp $base/.devbox/$1/docker-compose.yml
  fi
}

export TAG=${1:-latest}
get_docker_compose scala && docker-compose -f $HOME/.devbox/scala/docker-compose.yml run scalabox
