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
    this.router.get('/peaje/:id', this.controller.getPeajeId);
    this.router.get('/costoFijo/:id', this.controller.getFijosId);
    this.router.get('/costoVariable/:id', this.controller.getVariablesId);
  }
}
export default viajeRoute;