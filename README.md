## Infraestructura del sistema Mi Envío

Este rama contiene las guias y configuraciones indispensables para la puesta en marcha de los servicios necesarios para el correcto funcionamiento del sistema.

La infraestructura consta de cinco (5) servidores, dos (2) de estos alojados en las instalaciones de la Universidad Pontificia Bolivariana Seccional Bucaramanga y tres (3) alojados en la nube a través del servicio de azure. La distribución de los servicios a través de los servidores es de la siguiente manera:

#### 1.  Servidor manager de base de datos
Este servidor se encuentra alojado en la nube mediante el servicio de azure y es el encargado de administrar el cluster de docker swarm para el servicio de la base de datos, y a su vez, es el encargado de administrar el replica set del servicio de mongo.

#### 2.  Servidor worker de base de datos
Este servidor se encuentra alojado en la nube mediante el servicio de azure y es el encargado de ejecutar tareas delegados por el nodo manager.

#### 3.  Servidor manager de la aplicación
Este servidor se encuentra alojado en las instalaciondes de la universidad y es el encargado de administrar el cluster de docker swarm para el servicio de la aplicación (API).

#### 4.  Servidor worker de la aplicación
Este servidor se encuentra alojado en las instalaciondes de la universidad  y es el encargado de ejecutar tareas delegados por el nodo manager.

#### 5.  Servidor de backup

Este servidor se encuentra alojado en la nube mediante el servicio de azure y es quien se encarga de salvaguardar la información de la base de datos.