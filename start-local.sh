#!/usr/bin/env bash

docker build -t swarm-stack-inspector .
docker rm -f swarm-stack-inspector
docker run \
--name swarm-stack-inspector \
--publish 8888:8888 \
--env RAILS_LOG_TO_STDOUT=1 \
--env SECRET_KEY_BASE=a1f84adde74250330de641c3a649f14aabf424d0b8ee1f01e2ad07f68dcd0d0e08c83d9630dd6082d2355cf3145cfb3789a799ea09b7ff439e9863ad0f6222ef \
--volume /var/run/docker.sock:/var/run/docker.sock \
--rm \
--tty \
--interactive \
swarm-stack-inspector
