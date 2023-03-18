#!/bin/bash

# Use -> ./init.sh

mongosh <<EOF
use admin
db.createUser( { user: ${mongo_root}, pwd: ${mongo_root_password}, roles: [ { role: "root", db: "admin" }, { role: "readWriteAnyDatabase", db: "admin" } ] } )
db.setProfilingLevel(2)
use mienvio
db.createUser( { user: ${mongo_backend}, pwd: ${mongo_backend_password}, roles: [ { role: "readWrite", db: "mydb" } ] } )
db.setProfilingLevel(2)
exit
EOF