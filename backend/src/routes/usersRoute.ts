import { Router } from 'express';
import userController from '../controller/usersController';

class usersRoute{

  public router: Router;
  public controller: userController;

  constructor(){

    this.router = Router();
    this.controller = new userController();
    this.config();
  }

  public config(){

    this.router.post('/login', this.controller.login);
    this.router.post('/register', this.controller.register);
  }
}

export default usersRoute;