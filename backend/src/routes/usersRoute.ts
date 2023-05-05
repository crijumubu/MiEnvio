import { Router } from 'express';
import userController from '../controller/usersController';
class usersRoute {
   public router: Router;
   public controller: userController;
   constructor() {
      this.router = Router();
      this.controller = new userController();
      this.config();
   }
   public config() {
      /**
  * @swagger
  * /mienvio/api/login:
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
  *           example: prueba@hotmail.com
  *       - in: query
  *         name: contraseña
  *         description: contraseña correspondiente al usuario.
  *         schema:
  *           type: varchar
  *           minimum: 1
  *           example: SueggIP21!
  *     responses:
*       200:
 *         description: Datos del usuario.
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: null
 *                   example: null
 *                 data:
 *                   type: object
 *                   properties:
 *                     email:
 *                       type: string
 *                       example: "supervisor@mail.co"
 *                     token:
 *                       type: string
 *                       example: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN1cGVydmlzb3JAbWFpbC5jbyIsImlhdCI6MTY4MzE0MjUzNCwiZXhwIjoxNjgzMjI4OTM0fQ.Ls65KUZczUrfG8Mqk728a8xxzu-gS-1PafZWYI1AemY"
 *                     userType:
 *                       type: integer
 *                       example: 1
 *                     idUser:
 *                       type: integer
 *                       example: 1

 *       401:
  *         description: Email y contraseña incorrectos.
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
  *                   example: "Email o contraseña incorrecta!"
  * 
  *       500:
  *         description: Error interno del servidor.
  */
      this.router.post('/login', this.controller.login);
/**
 * @swagger
 * /mienvio/api/register:
 *   post:
 *     summary: Permite registrar a los clientes.
 *     description: Registra a los clientes mediante el nombre, correo, contraseña y tipo de usuario (Conductor, Gerente).
 *     parameters:
 *       - in: query
 *         name: name
 *         description: Nombre del respectivo usuario.
 *         schema:
 *           type: varchar
 *           minimum: 1
 *           example: Angela
 *       - in: query
 *         name: email
 *         description: Correo electrónico del usuario que se registra.
 *         schema:
 *           type: varchar
 *           minimum: 1
 *           example: hola@prueba.com
 *       - in: query
 *         name: password
 *         description: Contraseña del usuario que se registra.
 *         schema:
 *           type: varchar
 *           minimum: 1
 *           example: SueggIP21!
 *       - in: query
 *         name: userType
 *         description: Tipo de usuario que se registra (1 para Conductor, 2 para Gerente).
 *         schema:
 *           type: integer
 *           minimum: 1
 *           maximum: 2
 *           example: 1
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
 *                   example: "Registro exitoso!"
 *       500:
 *         description: Error interno del servidor.
 */
this.router.post('/register', this.controller.register);
/**
 * @swagger
 * /mienvio/api/getDataUser/{id}:
 *   get:
 *     summary: Obtiene los datos del usuario por ID.
 *     description: Obtiene los datos del usuario con el ID proporcionado.
 *     parameters:
 *       - in: path
 *         name: id
 *         description: ID del usuario a buscar.
 *         schema:
 *           type: integer
 *           minimum: 1
 *           example: 123
  *     responses:
   *       200:
   *         description: Datos del usuario.
   *         content:
   *           application/json:
   *             schema:
   *               type: array
   *               items:
   *                 type: object
   *                 properties:
   *                   _id:
   *                     type: string
   *                     example: "644dbccc098d888e99529c0a"
   *                   id:
   *                     type: integer
   *                     example: 1
   *                   name:
   *                     type: string
   *                     example: "Marta"
   *                   email:
   *                     type: string
   *                     example: "supervisor@mail.co"
   *                   password:
   *                     type: string
   *                     example: "$2a$10$ZX0cUS7MWOSM2wEbIvEauevWYHlk/EhJY/KcoctxI43m9RimECJvO"
   *                   userType:
   *                     type: integer
   *                     example: 1
   *             example:
   *               - {"_id": "644dbccc098d888e99529c0a", "id": 1, "name": "Marta", "email": "supervisor@mail.co", "password": "$2a$10$ZX0cUS7MWOSM2wEbIvEauevWYHlk/EhJY/KcoctxI43m9RimECJvO", "userType": 1}
   *       404:
   *         description: Usuario no encontrado.
   *       500:
   *         description: Error interno del servidor.
 */
this.router.get('/getDataUser/:id', this.controller.getUserData);
  /**
 * @swagger
 * /mienvio/api/updateUser:
 *   post:
 *     summary: Actualiza la información del usuario.
 *     description: Actualiza los datos personales del usuario (id, nombre, correo y contraseña).
 *     parameters:
 *       - in: query
 *         name: email
 *         description: Correo electrónico del usuario a actualizar.
 *         schema:
 *           type: string
 *           minimum: 1
 *           example: usuario@example.com
 *       - in: query
 *         name: name
 *         description: Nombre del usuario a actualizar.
 *         schema:
 *           type: string
 *           minimum: 1
 *           example: Juan Pérez
 *       - in: query
 *         name: password
 *         description: Contraseña del usuario a actualizar.
 *         schema:
 *           type: string
 *           minimum: 1
 *           example: password
 *     responses:
 *       200:
 *         description: El usuario ha sido actualizado con éxito.
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
 *                   example: Algo ha salido bien al realizar el registro!
 *       401:
 *         description: No se encontró el usuario.
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
 *                   example: El usuario no fue encontrado.
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

      this.router.post('/updateUser', this.controller.updateUser);
   }
}
export default usersRoute;