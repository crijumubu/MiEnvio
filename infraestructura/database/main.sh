#!/bin/bash

# Use -> ./init.sh

mongosh <<EOF
use admin
db.createUser({user: ${mongo_root}, pwd: ${mongo_root_password}, roles: [ { >
use mienvio
db.createUser({user: ${mongo_backend}, pwd: ${mongo_backend_password}, roles>
exit
EOF