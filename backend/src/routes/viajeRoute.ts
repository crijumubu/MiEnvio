import { Router } from 'express';
import ciudadModel from '../model/tipoVehiculoModel';
import viajesController from '../controller/viajesController';
class viajeRoute {
  public router: Router;
  public controller: viajesController;
  constructor() {
    this.router = Router();
    this.controller = new viajesController();
    this.config();
  }
  public config() {
    /**
 * @swagger
 * /dataInicial:
 *   get:
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
 * /peajeId:
 *   get:
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
    this.router.get('/peaje/:id', this.controller.getPeajeId);
    /**
 * @swagger
 * /costosFijosId:
 *   get:
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
    this.router.get('/costoFijo/:id', this.controller.getFijosId);
    /**
 * @swagger
 * /costoVariableId:
 *   get:
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
    this.router.get('/costoVariable/:id', this.controller.getVariablesId);
    /**
 * @swagger
 * /rutaIdorigenIddestino:
 *   get:
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
    this.router.get('/ruta/:idOrigen/:idDestino', this.controller.getRutaOriDet);
    /**
 * @swagger
 * /rutaPeaje:
 *   get:
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
    this.router.get('/rutaPeaje/:id', this.controller.getRutaPeajeId);
    /**
 * @swagger
 * /fleteId:
 *   get:
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
    this.router.get('/fleteId/:id', this.controller.getFlete);
    /**
 * @swagger
 * /detalleId:
 *   get:
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
    this.router.get('/detalleId/:id', this.controller.getDetalle);
    /**
 * @swagger
 * /viajeUsrId:
 *   get:
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
    this.router.get('/viajeIdUsr/:id', this.controller.getViaje);
    /**
 * @swagger
 * /registroViaje:
 *   post:
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
    this.router.post('/registroViaje',this.controller.registerViaje);
    /**
 * @swagger
 * /registroDetalles:
 *   post:
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
    this.router.post('/registroDetalles',this.controller.registerDetalle);
    /**
 * @swagger
 * /updateEstado:
 *   post:
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
    this.router.post('/cambioEstados',this.controller.updateEstado);
    /**
 * @swagger
 * /updateConductor:
 *   post:
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
    this.router.post('/asignar',this.controller.asignarConductor);
    /**
 * @swagger
 * /viajeActivo:
 *   get:
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
    this.router.get('/viajeIdUsrActivo/:id', this.controller.getViajeActivo);
    /**
 * @swagger
 * /viajeConductor:
 *   get:
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
    this.router.get('/viajeIdConductor/:id', this.controller.getViajeConductor);
    /**
 * @swagger
 * /viajeId:
 *   get:
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
    this.router.get('/viajeId/:id', this.controller.getViajeId);
    /**
 * @swagger
 * /registroFlete:
 *   post:
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
    this.router.post('/registroFlete',this.controller.registerFlete);
  }
}
export default viajeRoute;