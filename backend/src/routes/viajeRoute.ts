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

    this.router.get('/dataInicial', this.controller.dataInicio);

  }
}

export default viajeRoute;