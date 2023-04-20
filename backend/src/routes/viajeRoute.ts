import { Router } from 'express';
import ciudadModel from '../model/ciudadModel';


class viajeRoute{

  public router: Router;
  public controller: ciudadModel;

  constructor(){

    this.router = Router();
    this.controller = new ciudadModel();
    this.config();
  }

  public config(){

   // this.router.get('/ciudades', this.controller.idCiudad);
    
  }
}

export default viajeRoute;