## PASO A PASO PARA LA CONFIGURACIÓN DE LA API

En el proceso de configuración del servicio de MongoDB hay que tener en cuenta que este fue desplegado mediante un cluster de docker swarm, el cual cuenta con un nodo manager y un nodo worker para este caso en particular. Con esto claro, a continuación se detalla el paso a paso que se llevó para la configuración de este servicio.

&nbsp;

- #### Inicialización del swarm

```
docker swarm init
```

&nbsp;

- #### Incorporación del nodo worker al swarm

```
docker swarm join --token ${token} 10.154.12.73:2377
```

&nbsp;

- #### Puesta en marcha del gestor grafico del swarm de docker

```
docker service create -d --name vizualizer -p 80:8080 --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock dockersamples/visualizer
```

&nbsp;

- #### Deploy del servicio de la API en el swarm

```
docker service create --name Mienvio --replicas 2 --publish 1802:1802 crijumubu/mienvio_docker:backend
```

&nbsp;

- #### Configuración del servicio de la API en el swarm

```
docker service scale Mienvio=4

docker service update --update-order start-first Mienvio
```

&nbsp;

Con esto, el servicio correspondiente a la API queda puesto en marcha, pero hay que tener en cuenta que este se debe de actualizar cada vez que se carguen cambios en el repositorio, por lo cual, para esto, se desarrolló el un script el cual es ejecutado en cada action correspondiente a la rama del backend.

&nbsp;

##### NOTA: Si se desea ver el estado actual de swarm se puede dirigir al siguiente enlace, http://mienvio.bucaramanga.upb.edu.co/