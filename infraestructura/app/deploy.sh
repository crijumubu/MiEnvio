#! /bin/bash

docker pull crijumubu/mienvio_docker:backend
docker service update --image crijumubu/mienvio_docker:backend Mienvio