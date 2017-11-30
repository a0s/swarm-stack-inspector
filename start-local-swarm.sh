#!/usr/bin/env bash

#docker service rm registry
#docker service create \
#--name registry \
#--publish 5000:5000 \
#--detach=true \
#registry:2

docker build -t swarm-stack-inspector .
docker tag swarm-stack-inspector localhost:5000/swarm-stack-inspector
docker push localhost:5000/swarm-stack-inspector

docker service rm swarm-stack-inspector
docker service create \
--name swarm-stack-inspector \
--publish 8888:8888 \
--mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
--env RAILS_LOG_TO_STDOUT=1 \
--env SECRET_KEY_BASE=a1f84adde74250330de641c3a649f14aabf424d0b8ee1f01e2ad07f68dcd0d0e08c83d9630dd6082d2355cf3145cfb3789a799ea09b7ff439e9863ad0f6222ef \
--detach=false \
localhost:5000/swarm-stack-inspector \
bundle exec rackup --server thin --host 0.0.0.0 --port 8888
