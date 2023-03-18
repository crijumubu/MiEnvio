#!/bin/bash

# Use -> ./database_backup.sh

# Switch to user home

cd ~

# Back up mongodb database

/usr/bin/docker exec -i ${docker_container} /usr/bin/mongodump --username ${mongo_backup} --password ${mongo_backup_password} --authenticationDatabase admin --db ${mongo_database} --ou>

# Copy folder from docker container

/usr/bin/docker cp ${docker_container}:/dump ~

# Compress folder

folder_compress=~/dump
compressed_file=database_backup.zip

zip -r ${compressed_file} ${folder_compress}

# Send compressed file

sshpass -p ${ftp_password} sftp ${ftp_user}@${ftp_ip} <<EOF
cd ${destination_folder}
mput /home/${user}/${compressed_file}
bye
EOF

rm ~/${compressed_file}
rm -rf ~/dump