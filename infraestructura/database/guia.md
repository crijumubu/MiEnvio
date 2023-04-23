## PASO A PASO DE CONFIGURACIÓN DEL SERVICIO DE MONGO

En el proceso de configuración del servicio hay que tener en cuenta que este fue desplegado mediante un cluster de docker swarm, el cual para este caso, contiene dos nodos, un nodo manager y un nodo worker. Una vez con esto en mente, a continuación se detallada el paso a paso de configuración del servicio de mongo.

&nbsp;

- #### Inicialización del swarm

`docker swarm init`

&nbsp;

- #### Incorporación del nodo worker al swarm

`docker swarm join --token ${token} 192.168.0.4:2377`

&nbsp;

- #### Puesta en marcha del gestor grafico del swarm de docker

`docker service create -d --name vizualizer -p 8080:8080 --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock dockersamples/visualizer`

&nbsp;

- #### Deploy del servicio en el swarm

`docker network create -d overlay mienvio_net`

`docker stack deploy -c docker-compose.yml mienvio_database`

&nbsp;

- #### Acceso al servicio de mongo a traves del contenedor

`docker exec -it 801ea1cc9498 bash`

`mongosh`

&nbsp;

- #### Creación del replica set para el servicio de mongo

`rs.initiate({_id: "rs", members:[{_id: 0, host:"20.163.24.28:27017"}, {_id: 1, host:"20.163.25.165:27018"}]})`

&nbsp;

- #### Creación de usuarios de la base de datos admin y mienvio

`use admin
db.createUser({ user: "admin", pwd: ${ADMIN_PASSWORD}, roles: [ { role: "root", db: "admin" } ] })`

`use mienvio
db.createUser({ user: "backend", pwd: ${BACKEND_PASSWORD}, roles: [ { role: "readWrite", db: "mienvio" } ] } )`