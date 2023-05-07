## PASO A PASO PARA LA CONFIGURACIÓN DEL SERVICIO DE MONGODB

En el proceso de configuración del servicio de MongoDB hay que tener en cuenta que este fue desplegado mediante un cluster de docker swarm, el cual cuenta con un nodo manager y un nodo worker para este caso en particular. Además, hay que tener en cuenta que para compartir los datos entre cada una de las instancias fue necesaria la configuración de un replica set en MongoDB el cual facilita este trabajo. Por ultimo, cabe mencionar que el servicio de MongoDB se configuró para que la comunicación se de a través del protocolo TLS/SSL, garantizando así, la autenticidad de los servidores y permitiendo a su vez el cifrado de los datos transmitidos. Con esto claro, a continuación se detalla el paso a paso que se llevó para la configuración de este servicio.

&nbsp;

- #### Inicialización del swarm

```
docker swarm init
```

&nbsp;

- #### Incorporación del nodo worker al swarm

```
docker swarm join --token ${token} 192.168.0.4:2377
```

&nbsp;

- #### Puesta en marcha del gestor grafico del swarm de docker

```
docker service create -d --name vizualizer -p 80:8080 --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock dockersamples/visualizer
```

&nbsp;

- #### Creación de los certificados TLS/SSL

```
openssl req -nodes -out ca.pem -new -x509 -keyout ca.key

openssl req -nodes -newkey rsa:4096 -sha256 -keyout mongodb_node_1.key -out mongodb_node_1.csr
openssl req -nodes -newkey rsa:4096 -sha256 -keyout mongodb_node_2.key -out mongodb_node_2.csr

openssl x509 -req -in mongodb_node_1.csr -CA ca.pem -CAkey ca.key -set_serial 00 -out mongodb_node_1.crt
openssl x509 -req -in mongodb_node_2.csr -CA ca.pem -CAkey ca.key -set_serial 00 -out mongodb_node_2.crt

cat mongodb_node_1.key mongodb_node_1.crt > mongodb_node_1.pem
cat mongodb_node_2.key mongodb_node_2.crt > mongodb_node_2.pem

chmod 666 ca.key mongodb_node_1.pem mongodb_node_2.pem
```

&nbsp;

- #### Deploy del servicio en el swarm

```
docker network create -d overlay mienvio_net

docker stack deploy -c docker-compose.yml mienvio_database
```

&nbsp;

- #### Acceso al servicio de MongoDB a traves del contenedor

```
docker exec -it fd4d227f3a4c bash

mongosh --tlsAllowInvalidCertificates --tls --tlsCertificateKeyFile /data/mongodb_node_1.pem --tlsCAFile /data/ca.pem
```

&nbsp;

- #### Creación del replica set para el servicio de MongoDB

```
rs.initiate({_id: "rs", members:[{_id: 0, host:${MANAGER_NODE_IP:27017}}, {_id: 1, host:${WORKER_NODE_IP:27018}}]})
```

&nbsp;

- #### Creación de usuarios de la base de datos admin y mienvio

```
use admin
db.createUser({ user: "admin", pwd: ${ADMIN_PASSWORD}, roles: [ { role: "root", db: "admin" } ] })

use mienvio
db.createUser({ user: "backend", pwd: ${BACKEND_PASSWORD}, roles: [ { role: "readWrite", db: "mienvio" } ] } )
```

&nbsp;

##### NOTA: Si se desea ver el estado actual de swarm se puede dirigir al siguiente enlace, http://20.163.24.28/