#!/bin/bash

# Forma de uso -> ./main.sh + ftpFolder

# Pasos iniciales

cd ~

# Comprimir la carpeta

folder_compress=~/mongodb/database/
compressed_file=backup.zip

zip -r $compressed_file $folder_compress > /dev/null

# Enviar la carpeta comprimida

sshpass -p ${ftp_password} sftp ${ftp_user}@${ftp_ip} <<EOF
cd ${destination_folder}
mput /home/${USER}/$compressed_file
bye
EOF

# Eliminar la carpeta comprimida

rm ~/$compressed_file