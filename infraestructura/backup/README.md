 ## PASO A PASO DE CONFIGURACIÓN DE LAS COPIAS DE SEGURIDAD DE LA BASE DE DATOS

En el proceso de la realización de las copias de seguridad se ven involucradas dos máquinas, la primera corresponde al nodo manager del swarm de docker el cual corre el servicio de mongodb. La segunda corresponde a una máquina externa a lo que sería la infraestructura del proyecto en sí, la cual se encarga de alojar las copias de seguridad. Una vez claro esto, a continuación se detallará el paso a paso que se llevó a cabo en cada una de las máquinas.

&nbsp;

- #### Nodo manager del swarm de docker

`docker exec 801ea1cc9498 mongodump --db mienvio --out /backup/`
`docker cp 801ea1cc9498:/backup/ /home/Mienvio/mongodb`

La ejecución de los comandos detallados anteriormente fueron incorporados en un script de bash de nombre `backup.sh`, el cual se especificó en un cron job con el objetivo de que se ejecute todos los días a las 23:53 hora de Colombia de la siguiente manera:

`58 23 * * * /home/Mienvio/mongodb/scripts/backup.sh`

&nbsp;

- #### Servidor de backup

`rsync -avz Mienvio@20.163.24.28:/home/Mienvio/mongodb/backup ~ > ~/logs/$(date -I).txt`

La ejecución del comando detallado anteriormente se especificó en un cron job con el objetivo de que se ejecute todos los días a las 00:02 hora de Colombia de la siguiente manera:

`2 0 * * * rsync -avz Mienvio@20.163.24.28:/home/Mienvio/mongodb/backup ~ > ~/logs/$(date -I).txt`  

&nbsp;

##### NOTA: Cabe resaltar que el servidor de backup se configuró en una máquina virtual de azure la cual se encuentra apagada durante toda la jordana y únicamente se enciende automáticamente en el rango de tiempo de las 23:55 a las 00:05