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
    this.router.get('/ruta/:idOrigen/:idDestino', this.controller.getRutaOriDet);
    this.router.get('/rutaPeaje/:id', this.controller.getRutaPeajeId);
    this.router.get('/fleteId/:id', this.controller.getFlete);
    this.router.get('/detalleId/:id', this.controller.getDetalle);
    this.router.get('/viajeIdUsr/:id', this.controller.getViaje);
    this.router.post('/resgitroViaje',this.controller.registerViaje);
    this.router.post('/registroDetalles',this.controller.registerDetalle);
    this.router.post('/cambioEstados',this.controller.updateEstado);
    this.router.post('/asignar',this.controller.asignarConductor);
  }
}
export default viajeRoute;