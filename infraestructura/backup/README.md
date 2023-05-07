 ## PASO A PASO DE CONFIGURACIÓN DE LAS COPIAS DE SEGURIDAD DE LA BASE DE DATOS


En el proceso de la realización de las copias de seguridad se ven involucradas dos máquinas, la primera, corresponde al nodo manager del swarm de docker el cual corre el servicio de mongodb; la segunda, corresponde a una máquina externa a lo que sería la infraestructura del proyecto en sí, la cual se encarga de alojar las copias de seguridad. Una vez claro esto, a continuación se detallará el paso a paso que se llevó a cabo en cada una de las máquinas.

&nbsp;

- #### Nodo manager del swarm de docker

En el servidor manager del swarm correspondiente a la base de datos se desarrolló un script el cual se encarga de realizar las copias de seguridad mediante mongodump, esto, manipulando el contenedor de docker para que se genere la copia de seguridad allí para posteriormente extraer esta información a la maquina host. Este script se configuró para que se ejecute cada cierto tiempo mediante un cron job, para este caso, se configuró para que se ejecute todos los días a las 23:58 hora de Colombia de la siguiente manera:

```
58 23 * * * /home/Mienvio/mongodb/scripts/backup.sh
```

&nbsp;

- #### Servidor de backup

En el servidor backup se desarrollaron dos scripts los cuales mediante un cron job se configuraron para que se ejecutarán cada cierto tiempo. El primero de estos corresponde al script que se encarga de realizar un backup completo el cual se ejecuta todos los domingos en la madrugada a las 00:00 hora de Colombia; y el segundo de estos corresponde al script que se encarga de realizar un backup incremental el cual se ejecuta todos los días en la madrugada a las 00:02 hora de Colombia. Todo lo anterior fue configurado mediante un cron job de la siguiente manera:

```
0 0 * * 0 /home/Mienvio/scripts/complete_backup.sh

2 0 * * * /home/Mienvio/scripts/incremental_backup.sh
```

&nbsp;

##### NOTA: Cabe resaltar que el servidor de backup se configuró en una máquina virtual de azure la cual se encuentra apagada durante toda la jordana y únicamente se enciende automáticamente en el rango de tiempo de las 23:55 a las 00:05