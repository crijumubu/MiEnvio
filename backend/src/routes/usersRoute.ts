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
 * /login:
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
    this.router.post('/login', this.controller.login);
    this.router.post('/register', this.controller.register);
    /**
 * @swagger
 * /getDataUser:
 *   get:
 *     summary: Obtiene los datos del usuario.
 *     description: Obtiene los datos del usuario con el ID proporcionado.
 *     parameters:
 *       - in: query
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
    this.router.get('/getDataUser/:id', this.controller.getUserData);
    this.router.post('/updateUser', this.controller.updateUser);
  }
}
export default usersRoute;