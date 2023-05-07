#!/bin/bash

docker exec fd4d227f3a4c mongodump --ssl --tlsInsecure --sslCAFile /data/ca.pem --sslPEMKeyFile /data/mongodb_node_1.pem --oplog --out /backup/
docker cp fd4d227f3a4c:/backup/ /home/Mienvio/mongodb
