#!/bin/bash

docker exec 801ea1cc9498 mongodump  --out /backup/
docker cp 801ea1cc9498:/backup/ /home/Mienvio/mongodb