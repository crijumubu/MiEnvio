#!/bin/bash

rsync -avz Mienvio@20.163.24.28:/home/Mienvio/mongodb/backup /home/Mienvio/backups/ > ~/logs/incremental/$(date -I).txt