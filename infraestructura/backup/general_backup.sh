#!/bin/bash

# Use -> ./general_backup.sh

# Switch to user's home

cd ~

# Copy folder from docker container

/usr/bin/docker cp ${docker_container}:/data/db ~

# Compress folder

folder_compress=~/db
compressed_file=general_backup.zip

zip -r ${compressed_file} ${folder_compress}

# Send compressed file

sshpass -p ${ftp_password} sftp ${ftp_user}@${ftp_ip} <<EOF
cd ${destination_folder}
mput /home/${user}/${compressed_file}
bye
EOF

# Delete all files and folders used to do the task

rm ~/${compressed_file}
rm -rf ~/db