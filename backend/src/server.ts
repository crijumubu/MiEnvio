import express, { Application, json, urlencoded } from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import usersRoute from './routes/usersRoute';
import viajeRoute from './routes/viajeRoute';
import swaggerUi from 'swagger-ui-express';
import swaggerJsDoc from 'swagger-jsdoc';
import { options } from './swaggerOptios';
class Server {
  private backend: Application;
  private userRouter: usersRoute;
  private viajeRoute: viajeRoute
  constructor() {
    dotenv.config();
    this.backend = express();
    this.userRouter = new usersRoute();
    this.viajeRoute = new viajeRoute();
    this.config();
    this.route();
    this.start();
    
  }
  public config = () => {
    this.backend.set('port', process.env.PORT);
    this.backend.use(urlencoded({ extended: true }));
    this.backend.use(json());
    this.backend.use(cors());
    const specs = swaggerJsDoc(options);
    console.log(specs);
    this.backend.use('/docs',swaggerUi.serve, swaggerUi.setup(specs));
    
  }
  public route = () => {
    this.backend.use(`${process.env.USERSROUTE}`, this.userRouter.router);
    this.backend.use(`${process.env.USERSROUTE}`, this.viajeRoute.router);
  }
  public start = () => {
    this.backend.listen(process.env.PORT, () => {
      console.log('Server on port:', process.env.PORT);
    });
  }
}
const server = new Server();