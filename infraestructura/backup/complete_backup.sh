#!/bin/bash

if [ -d "/home/Mienvio/backups/backup/" ]; then

  mv /home/Mienvio/backups/backup /home/Mienvio/backups/$(date +%V_%B_%Y)

fi

rsync -avz Mienvio@20.163.24.28:/home/Mienvio/mongodb/backup /home/Mienvio/backups/ > ~/logs/complete/$(date +%V_%B_%Y).txt