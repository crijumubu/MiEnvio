"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const viajesController_1 = __importDefault(require("../controller/viajesController"));
class viajeRoute {
    constructor() {
        this.router = (0, express_1.Router)();
        this.controller = new viajesController_1.default();
        this.config();
    }
    config() {
        /**
     * @swagger
     * tags:
      - name: pet
        description: Everything about your Pets
        externalDocs:
          description: Find out more
          url: http://swagger.io
     * /dataInicial:
     *   get:
     *     tags:
            - pet
     *     summary: inicio de sesion del usuario.
     *     description: permite al usuario iniciar sesion con el correo y contraseña.
     *     parameters:
     *       - in: query
     *         name: email
     *         description: email del usuario que se loguea.
     *         schema:
     *           type: varchar
     *           minimum: 1
     *           example: 123
     *       - in: query
     *         name: email
     *         description: email del usuario que se loguea.
     *         schema:
     *           type: varchar
     *           minimum: 1
     *           example: 123
     *     responses:
     *       200:
     *         description: Datos del usuario.
     *         content:
     *           application/json:
     *             schema:
     *               type: object
     *               properties:
     *                 id:
     *                   type: integer
     *                   example: 123
     *                 name:
     *                   type: string
     *                   example: "Juan Pérez"
     *                 email:
     *                   type: string
     *                   example: "juan.perez@example.com"
     *       404:
     *         description: Usuario no encontrado.
     *       500:
     *         description: Error interno del servidor.
     */
        this.router.get('/dataInicial', this.controller.dataInicio);
        /**
      * @swagger
      * /mienvio/api/peaje/{id}:
      *   get:
      *     summary: Consulta de peajes por ID.
      *     description: Consulta información de un peaje por su ID.
      *     parameters:
      *       - in: path
      *         name: id
      *         description: ID del peaje a buscar.
      *         required: true
      *         schema:
      *           type: integer
      *           example: 1
      *     responses:
      *       200:
      *         description: Datos del peaje.
      *         content:
      *           application/json:
      *             schema:
      *               type: array
      *               items:
      *                 type: object
      *                 properties:
      *                   _id:
      *                     type: string
      *                     example: "6446af4f2a5ce14781d32538"
      *                   idPeaje:
      *                     type: integer
      *                     example: 1
      *                   nombrePeaje:
      *                     type: string
      *                     example: "CASABLANCA"
      *                   sector:
      *                     type: string
      *                     example: "Cogua ? Tausa Km 40+000 SUR NORTE- NORTE SUR ZIPAQUIRA TAUSA"
      *                   categoriaI:
      *                     type: integer
      *                     example: 9100
      *                   categoriaII:
      *                     type: integer
      *                     example: 9800
      *                   categoriaIII:
      *                     type: integer
      *                     example: 25600
      *                   categoriaIV:
      *                     type: integer
      *                     example: 31800
      *                   categoriaV:
      *                     type: integer
      *                     example: 37200
      *       401:
      *         description: No se encontraron datos.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: true
      *                 message:
      *                   type: string
      *                   example: "No se encontraron datos para el ID especificado."
      *       500:
      *         description: Error interno del servidor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: true
      *                 message:
      *                   type: string
      *                   example: "Ocurrió un error interno en el servidor."
      */
        this.router.get('/peaje/:id', this.controller.getPeajeId);
        /**
         * @swagger
         * /mienvio/costosFijosId/{id}:
         *   get:
         *     summary: Obtener información de un costo fijo por ID.
         *     description: Este endpoint permite obtener la información de un costo fijo en particular, identificado por su ID.
         *     parameters:
         *       - in: query
         *         name: id
         *         description: ID del costo fijo a buscar.
         *         schema:
         *           type: integer
         *           minimum: 1
         *           example: 123
         *     responses:
         *       200:
         *         description: Información del costo fijo encontrada exitosamente.
         *         content:
         *           application/json:
         *             schema:
         *               type: array
         *               items:
         *                 type: object
         *                 properties:
         *                   _id:
         *                     type: string
         *                     example: "6446ae3c2a5ce14781d32118"
         *                   idItemFijo:
         *                     type: integer
         *                     example: 1
         *                   idConfiguracionVehiculo:
         *                     type: integer
         *                     example: 1
         *                   nombreItemFijo:
         *                     type: string
         *                     example: "Capital"
         *       401:
         *         description: No se encontró información para el ID proporcionado.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 message:
         *                   type: string
         *                   example: "No se encontró información para el ID proporcionado."
         *
         *       500:
         *         description: Error interno del servidor.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 message:
         *                   type: string
         *                   example: "Error interno del servidor."
         *
         */
        this.router.get('/costoFijo/:id', this.controller.getFijosId);
        /**
       * @swagger
       * /mienvio/api/costoVariable/{id}:
       *   get:
       *     summary: Obtener costo variable por ID.
       *     description: Obtiene el costo variable correspondiente al ID especificado.
       *     parameters:
       *       - in: path
       *         name: id
       *         description: ID del costo variable a obtener.
       *         required: true
       *         schema:
       *           type: integer
       *           minimum: 1
       *           example: 123
       *     responses:
       *       200:
       *         description: Costo variable obtenido correctamente.
       *         content:
       *           application/json:
       *             schema:
       *               type: array
       *               items:
       *                 type: object
       *                 properties:
       *                   _id:
       *                     type: string
       *                     example: "6446ae5e2a5ce14781d321b1"
       *                   idItemVariable:
       *                     type: integer
       *                     example: 1
       *                   idConfiguracionVehiculo:
       *                     type: integer
       *                     example: 1
       *                   nombreItemVariable:
       *                     type: string
       *                     example: "Llantas Direccionales"
       *                   cantidadItemVariable:
       *                     type: integer
       *                     example: 2
       *                   cambioItemVariable:
       *                     type: integer
       *                     example: 80
       *                   costoItemVariableKm:
       *                     type: string
       *                     example: "$57.52"
       *                   idParametroItemVariable:
       *                     type: integer
       *                     example: 1
       *       401:
       *         description: El usuario no está autorizado para acceder a este recurso.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 message:
       *                   type: string
       *                   example: "No se encontro costo"
       *       500:
       *         description: Error interno del servidor.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 message:
       *                   type: string
       *                   example: "Error interno del servidor."
       */
        this.router.get('/costoVariable/:id', this.controller.getVariablesId);
        /**
      * @swagger
      * /ruta/{IDEntrada}/{IDSalida}:
      *   get:
      *     summary: Consulta de ruta por entrada y salida.
      *     description: Permite obtener la información de la ruta correspondiente a la entrada y salida especificadas.
      *     parameters:
      *       - in: path
      *         name: IDEntrada
      *         description: Identificador de la ciudad de origen.
      *         schema:
      *           type: integer
      *           minimum: 1
      *           example: 1
      *       - in: path
      *         name: IDSalida
      *         description: Identificador de la ciudad de destino.
      *         schema:
      *           type: integer
      *           minimum: 1
      *           example: 2
      *     responses:
      *       200:
      *         description: Información de la ruta correspondiente a la entrada y salida especificadas.
      *         content:
      *           application/json:
      *             schema:
      *               type: array
      *               items:
      *                 type: object
      *                 properties:
      *                   _id:
      *                     type: string
      *                     example: "644dafa0dd2e9ee74ae2e54b"
      *                   idRuta:
      *                     type: integer
      *                     example: 1
      *                   idCiudadOrigen:
      *                     type: integer
      *                     example: 1
      *                   idCiudadDestino:
      *                     type: integer
      *                     example: 2
      *                   nombreRuta:
      *                     type: string
      *                     example: "Bogotá-Bucaramanga"
      *                   urbanoRuta:
      *                     type: integer
      *                     example: 20
      *                   despavimentadoRuta:
      *                     type: integer
      *                     example: 0
      *       401:
      *         description: Ruta no encontrada.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: string
      *                   example: "Ruta no encontrada"
      *       500:
      *         description: Error interno del servidor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: string
      *                   example: "Error interno del servidor."
      */
        this.router.get('/ruta/:idOrigen/:idDestino', this.controller.getRutaOriDet);
        /**
      * @swagger
      * /mienvio/api/rutaPeaje/{IDRuta}:
      *   get:
      *     summary: Obtener peajes de una ruta.
      *     description: Obtiene una lista de peajes correspondientes a la ruta especificada por su IDRuta.
      *     parameters:
      *       - in: path
      *         name: IDRuta
      *         description: ID de la ruta a la que se le quieren obtener los peajes.
      *         schema:
      *           type: integer
      *           minimum: 1
      *           example: 1
      *     responses:
      *       200:
      *         description: Lista de peajes.
      *         content:
      *           application/json:
      *             schema:
      *               type: array
      *               items:
      *                 type: object
      *                 properties:
      *                   _id:
      *                     type: string
      *                     example: "6446af812a5ce14781d32540"
      *                   idRutaPeaje:
      *                     type: integer
      *                     example: 1
      *                   idRuta:
      *                     type: integer
      *                     example: 1
      *                   idPeaje:
      *                     type: integer
      *                     example: 1
      *       401:
      *         description: Ruta no encontrada.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: string
      *                   example: "No se encontro la ruta"
      *       500:
      *         description: Error interno del servidor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: string
      *                   example: "Error interno del servidor."
      *
      */
        this.router.get('/rutaPeaje/:id', this.controller.getRutaPeajeId);
        /**
       * @swagger
       * /mienvio/api/fleteId/{IDFlete}:
       *   get:
       *     summary: Consulta de información de flete por IDFlete.
       *     description: Permite consultar la información del flete correspondiente al IDFlete especificado en la URL.
       *     parameters:
       *       - in: path
       *         name: IDFlete
       *         description: Identificador único del flete a consultar.
       *         required: true
       *         schema:
       *           type: integer
       *           minimum: 1
       *           example: 3
       *
       *     responses:
       *       200:
       *         description: Información del flete correspondiente al IDFlete especificado.
       *         content:
       *           application/json:
       *             schema:
       *               type: array
       *               items:
       *                 type: object
       *                 properties:
       *                   id:
       *                     type: integer
       *                     example: 3
       *                   idViaje:
       *                     type: integer
       *                     example: 2
       *                   toneladaKilometro:
       *                     type: integer
       *                     example: 25
       *                   costoTonelada:
       *                     type: integer
       *                     example: 85250
       *                   costocarga:
       *                     type: integer
       *                     example: 2131250
       *                   costoHoraadicional:
       *                     type: integer
       *                     example: 48000
       *                   horasEspera:
       *                     type: integer
       *                     example: 22
       *                   costoTiempoEspera:
       *                     type: integer
       *                     example: 38000
       *                   toneladaKilometroViaje:
       *                     type: integer
       *                     example: 30459
       *                   toneladaViaje:
       *                     type: integer
       *                     example: 11934
       *                   costoKilometro:
       *                     type: integer
       *                     example: 3000
       *                   costoKilometroViaje:
       *                     type: integer
       *                     example: 32412
       *       401:
       *         description: No autorizado.
       *       404:
       *         description: No se encontró el flete correspondiente al IDFlete especificado.
       *       500:
       *         description: Error interno del servidor.
       */
        this.router.get('/fleteId/:id', this.controller.getFlete);
        this.router.get('/fleteIdViaje/:id', this.controller.getFleteViaje);
        /**
      * @swagger
      * /mienvio/api/detalleId/{id}:
      *   get:
      *     summary: Obtener detalles de un flete por ID.
      *     description: Obtiene los detalles de un flete específico según su ID.
      *     parameters:
      *       - in: path
      *         name: id
      *         description: ID del flete a buscar.
      *         required: true
      *         schema:
      *           type: integer
      *           example: 1
      *     responses:
      *       200:
      *         description: Detalles del flete.
      *         content:
      *           application/json:
      *             schema:
      *               type: array
      *               items:
      *                 type: object
      *                 properties:
      *                   _id:
      *                     type: string
      *                     example: "64494fdd28d6dfee9e75c7d7"
      *                   idFlete:
      *                     type: integer
      *                     example: 1
      *                   tipoCosto:
      *                     type: string
      *                     example: "1"
      *                   concepto:
      *                     type: string
      *                     example: "Capital"
      *                   mes:
      *                     type: integer
      *                     example: 55076
      *                   viaje:
      *                     type: integer
      *                     example: 99614
      *                   tonelada:
      *                     type: integer
      *                     example: 47909
      *                   participacion:
      *                     type: integer
      *                     example: 23543
      *       404:
      *         description: Flete no encontrado.
      *       500:
      *         description: Error interno del servidor.
      */
        this.router.get('/detalleId/:id', this.controller.getDetalle);
        /**
         * @swagger
         * /mienvio/api/viajeIdUsr/{idcliente}:
         *   get:
         *     summary: Filtra y busca los viajes del cliente
         *     description: Mediante el ID del cliente el sistema permite ver tanto sus viajes activos como inactivos.
         *     parameters:
         *       - in: path
         *         name: idcliente
         *         description: ID del cliente que se desea buscar.
         *         required: true
         *         schema:
         *           type: integer
         *           minimum: 1
         *     responses:
         *       200:
         *         description: Viajes del cliente.
         *         content:
         *           application/json:
         *             schema:
         *               type: array
         *               items:
         *                 type: object
         *                 properties:
         *                   _id:
         *                     type: string
         *                     example: "6452f32067e5500c33a29c8d"
         *                   idViaje:
         *                     type: integer
         *                     example: 1
         *                   idUsuario:
         *                     type: integer
         *                     example: 1
         *                   nombre:
         *                     type: string
         *                     example: "Viaje1"
         *                   origen:
         *                     type: string
         *                     example: "Bogota"
         *                   destino:
         *                     type: string
         *                     example: "Bucaramanga"
         *                   estado:
         *                     type: integer
         *                     example: 3
         *                   idConductor:
         *                     type: integer
         *                     example: 2
         *                   direccion:
         *                     type: string
         *                     example: "Autopista Piedecuesta Kilómetro 7,, Floridablanca, Santander"
         *       401:
         *         description: El usuario no tiene viajes.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 error:
         *                   type: boolean
         *                   example: true
         *                 message:
         *                   type: string
         *                   example: "El usuario no tiene viajes"
         *       500:
         *         description: Error interno del servidor.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 error:
         *                   type: boolean
         *                   example: true
         *                 message:
         *                   type: string
         *                   example: "Error interno"
         */
        this.router.get('/viajeIdUsr/:id', this.controller.getViaje);
        /**
       * @swagger
       * /mienvio/api/registroViaje:
       *   post:
       *     summary: Registra viajes según el usuario
       *     description: Registra y asocia un nuevo viaje con un cliente mediante su ID
       *     parameters:
       *       - in: query
       *         name: idUsuario
       *         description: Identificador del usuario que realiza el registro de viaje.
       *         schema:
       *           type: integer
       *           minimum: 1
       *           example: 1
       *       - in: query
       *         name: nombre
       *         description: Nombre del viaje.
       *         schema:
       *           type: string
       *           minimum: 1
       *           example: Viaje1
       *       - in: query
       *         name: origen
       *         description: Ciudad de origen del viaje.
       *         schema:
       *           type: string
       *           minimum: 1
       *           example: Bogota
       *       - in: query
       *         name: destino
       *         description: Ciudad de destino del viaje.
       *         schema:
       *           type: string
       *           minimum: 1
       *           example: Bucaramanga
       *       - in: query
       *         name: estado
       *         description: Estado del registro de viaje.
       *         schema:
       *           type: integer
       *           minimum: 1
       *           example: 1
       *       - in: query
       *         name: direccion
       *         description: Dirección del viaje.
       *         schema:
       *           type: string
       *           minimum: 1
       *           example: Autopista Piedecuesta Kilómetro 7, Floridablanca, Santander
       *     responses:
       *       200:
       *         description: Registro exitoso del viaje.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 error:
       *                   type: boolean
       *                   example: false
       *                 message:
       *                   type: string
       *                   example: Registro exitoso!
       *                 idViaje:
       *                   type: integer
       *                   example: 1
       *       401:
       *         description: Recurso no encontrado.
       *       500:
       *         description: Error interno del servidor.
       */
        this.router.post('/registroViaje', this.controller.registerViaje);
        /**
      * @swagger
      * /mienvio/api/registroDetalles:
      *   post:
      *     summary: Registro de detalles de un flete.
      *     description:  Registra los detalles de un flete (ID de flete, tipo de costo, concepto, mes, viaje, tonelada y participación).
      *     parameters:
      *       - in: query
      *         name: idFlete
      *         description: ID del flete.
      *         schema:
      *           type: integer
      *           example: 1
      *       - in: query
      *         name: tipoCosto
      *         description: Tipo de costo.
      *         schema:
      *           type: integer
      *           example: 3
      *       - in: query
      *         name: concepto
      *         description: Concepto del detalle.
      *         schema:
      *           type: string
      *           example: "prueba"
      *       - in: query
      *         name: mes
      *         description: Mes del detalle.
      *         schema:
      *           type: integer
      *           example: 7878
      *       - in: query
      *         name: viaje
      *         description: Viaje del detalle.
      *         schema:
      *           type: integer
      *           example: 7878
      *       - in: query
      *         name: tonelada
      *         description: Tonelada del detalle.
      *         schema:
      *           type: integer
      *           example: 7878
      *       - in: query
      *         name: participacion
      *         description: Participación del detalle.
      *         schema:
      *           type: integer
      *           example: 7878
      *     responses:
      *       200:
      *         description: Registro exitoso.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: false
      *                 message:
      *                   type: string
      *                   example: "Algo ha salido bien al realizar el registro!"
      *       500:
      *         description: Error interno del servidor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: false
      *                 message:
      *                   type: string
      *                   example: "Error interno"
      */
        this.router.post('/registroDetalles', this.controller.registerDetalle);
        /**
       * @swagger
       * /mienvio/api/cambioEstados:
       *   put:
       *     summary: Cambiar estado de un viaje.
       *     description: Permite cambiar el estado de un viaje en la base de datos.
       *     parameters:
       *       - in: query
       *         name: idViaje
       *         description: ID del viaje que se desea actualizar.
       *         schema:
       *           type: integer
       *           minimum: 1
       *           example: 123
       *       - in: query
       *         name: estado
       *         description: Nuevo estado del viaje (1 - Pendiente, 2 - En proceso, 3 - Entregado).
       *         schema:
       *           type: integer
       *           minimum: 1
       *           maximum: 3
       *           example: 2
       *     responses:
       *       200:
       *         description: El estado del viaje ha sido actualizado exitosamente.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 error:
       *                   type: boolean
       *                   example: false
       *                 message:
       *                   type: string
       *                   example: "El estado del viaje ha sido actualizado."
       *       401:
       *         description: No se encontró el viaje en la base de datos.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 error:
       *                   type: boolean
       *                   example: true
       *                 message:
       *                   type: string
       *                   example: "No se encontró el viaje en la base de datos."
       *       500:
       *         description: Error interno del servidor.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 error:
       *                   type: boolean
       *                   example: true
       *                 message:
       *                   type: string
       *                   example: "Error interno del servidor."
       */
        this.router.post('/cambioEstados', this.controller.updateEstado);
        /**
      * @swagger
      * /mienvio/api/asignar:
      *   put:
      *     summary: Asigna un conductor a un viaje.
      *     description: Asigna un conductor a un viaje específico.
      *     parameters:
      *       - in: body
      *         name: body
      *         description: Objeto JSON que contiene la información del viaje y del conductor a asignar.
      *         required: true
      *         schema:
      *           type: object
      *           properties:
      *             idViaje:
      *               type: integer
      *               example: 2
      *             idConductor:
      *               type: integer
      *               example: 3
      *     responses:
      *       200:
      *         description: Mensaje de éxito al asignar un conductor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: false
      *                 message:
      *                   type: string
      *                   example: "Se actualizó el conductor"
      *       401:
      *         description: Mensaje de error al no encontrar al conductor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: true
      *                 message:
      *                   type: string
      *                   example: "No se encontró el conductor"
      *       500:
      *         description: Mensaje de error interno del servidor.
      *         content:
      *           application/json:
      *             schema:
      *               type: object
      *               properties:
      *                 error:
      *                   type: boolean
      *                   example: true
      *                 message:
      *                   type: string
      *                   example: "Error interno"
      */
        this.router.get('/viajeIdUsrActivo/:id', this.controller.getViajeActivo);
        this.router.get('/viajeIdConductor/:id', this.controller.getViajeConductor);
        /**
       * @swagger
       * /mienvio/api/viajeId/{IdViaje}:
       *   get:
       *     summary: Busca un viaje por su ID.
       *     description: Permite buscar un viaje por su ID y obtener su información.
       *     parameters:
       *       - in: path
       *         name: IdViaje
       *         description: ID del viaje a buscar.
       *         schema:
       *           type: integer
       *           minimum: 1
       *           example: 1
       *     responses:
       *       200:
       *         description: Información del viaje solicitado.
       *         content:
       *           application/json:
       *             schema:
       *               type: array
       *               items:
       *                 type: object
       *                 properties:
       *                   _id:
       *                     type: string
       *                     example: "6452f32067e5500c33a29c8d"
       *                   idViaje:
       *                     type: integer
       *                     example: 1
       *                   idUsuario:
       *                     type: integer
       *                     example: 1
       *                   nombre:
       *                     type: string
       *                     example: "Viaje1"
       *                   origen:
       *                     type: string
       *                     example: "Bogota"
       *                   destino:
       *                     type: string
       *                     example: "Bucaramanga"
       *                   estado:
       *                     type: integer
       *                     example: 1
       *                   idConductor:
       *                     type: integer
       *                     example: 0
       *                   direccion:
       *                     type: string
       *                     example: "Autopista Piedecuesta Kilómetro 7,, Floridablanca, Santander"
       *       401:
       *         description: El viaje buscado no existe.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 error:
       *                   type: boolean
       *                   example: true
       *                 message:
       *                   type: string
       *                   example: "No se encontró el viaje."
       *       500:
       *         description: Error interno del servidor.
       *         content:
       *           application/json:
       *             schema:
       *               type: object
       *               properties:
       *                 error:
       *                   type: boolean
       *                   example: true
       *                 message:
       *                   type: string
       *                   example: "Error interno."
       */
        this.router.get('/viajeId/:id', this.controller.getViajeId);
        /**
         * @swagger
         * /mienvio/api/registroFlete:
         *   post:
         *     summary: Registro de flete.
         *     description: Registra los datos del flete en el sistema.
         *     parameters:
         *       - in: body
         *         name: datosFlete
         *         description: Datos del flete a registrar.
         *         schema:
         *           type: object
         *           properties:
         *             idViaje:
         *               type: integer
         *               description: ID del viaje.
         *               example: 1
         *             toneladaKilometro:
         *               type: integer
         *               description: Costo de la tonelada por kilómetro.
         *               example: 7878
         *             costoTonelada:
         *               type: integer
         *               description: Costo por tonelada.
         *               example: 7878
         *             costocarga:
         *               type: integer
         *               description: Costo de carga.
         *               example: 7878
         *             costoHoraadicional:
         *               type: integer
         *               description: Costo de hora adicional.
         *               example: 7878
         *             horasEspera:
         *               type: integer
         *               description: Horas de espera.
         *               example: 7878
         *             costoTiempoEspera:
         *               type: integer
         *               description: Costo de tiempo de espera.
         *               example: 7878
         *             toneladaKilometroViaje:
         *               type: integer
         *               description: Costo de la tonelada por kilómetro en el viaje.
         *               example: 7878
         *             toneladaViaje:
         *               type: integer
         *               description: Costo de la tonelada en el viaje.
         *               example: 7878
         *             costoKilometro:
         *               type: integer
         *               description: Costo por kilómetro.
         *               example: 7878
         *             costoKilometroViaje:
         *               type: integer
         *               description: Costo por kilómetro en el viaje.
         *               example: 7878
         *         required:
         *           - idViaje
         *           - toneladaKilometro
         *           - costoTonelada
         *           - costocarga
         *           - costoHoraadicional
         *           - horasEspera
         *           - costoTiempoEspera
         *           - toneladaKilometroViaje
         *           - toneladaViaje
         *           - costoKilometro
         *           - costoKilometroViaje
         *     responses:
         *       200:
         *         description: Registro exitoso.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 error:
         *                   type: boolean
         *                   example: false
         *                 message:
         *                   type: string
         *                   example: Registro exitoso!
         *       401:
         *         description: Viaje no encontrado.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 error:
         *                   type: boolean
         *                   example: true
         *                 message:
         *                   type: string
         *                   example: Viaje no encontrado
         *       500:
         *         description: Error interno del servidor.
         *         content:
         *           application/json:
         *             schema:
         *               type: object
         *               properties:
         *                 error:
         *                   type: boolean
         *                   example: true
         *                 message:
         *                   type: string
         *                   example: Error interno del servidor.
         */
        this.router.post('/registroFlete', this.controller.registerFlete);
        //this.router.get('/calcular', this.controller.calcularViaje);
        this.router.post('/asignar', this.controller.asignarConductor);
    }
}
exports.default = viajeRoute;
