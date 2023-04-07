import { Request, Response } from 'express';
import usersModel from '../model/usersModel';

const jwt = require('jsonwebtoken');

class usersController {

  private model: usersModel;

  constructor() {

    this.model = new usersModel();
  }

  public login = (req: Request, res: Response) => {

    const { email, password } = req.body;

    this.model.login(email, password, (status: number, userType: number) => {

      switch (status) {
        case 1: {

          const token = jwt.sign({ email: email }, process.env.TOKEN_SECRET, { expiresIn: '1d', algorithm: 'HS256' });
          res.header('auth-token', token).json({ error: null, data: { email, token, userType } });
          //console.log(userType);
          break;
        }
        case 0: {

          return res.status(401).json({ error: true, message: 'Email o contraseña incorrecta!' });
        }
        case -1: {

          return res.status(500).json({ error: true, message: 'Algo ha salido mal al realizar el registro!' });
        }
      }
    });
  }

  public register = (req: Request, res: Response) => {

    const { name, email, password, userType } = req.body;

    this.model.register(name, email, password, userType, (error: any) => {

      if (!error) {

        return res.status(200).json({ error: false, message: 'Registro exitóso!' });
      }
      else {

        const usedEmailError = error.keyPattern['email'];

        if (usedEmailError) {

          return res.status(409).json({ error: true, message: 'El correo ya se encuentra en uso!' });
        }

        return res.status(500).json({ error: true, message: 'Algo ha salido mal al realizar el registro!' });
      }
    });
  }

  public verifyToken = (req: Request, res: Response, next: () => void) => {

    const { authorization } = req.headers;

    if (!authorization) {

      return res.status(401).json({ error: true, message: 'No se ha proporcionado un token de acceso. Acceso denegado!' });
    }

    const bearerToken = authorization.split(' ')[1];

    try {

      const decodedToken = jwt.verify(bearerToken, process.env.TOKEN_SECRET);
      req.body.user = decodedToken;
      next();
    }
    catch (error) {

      if (error instanceof jwt.TokenExpiredError) {

        res.status(200).json({ error: true, message: 'El token ha expirado!' });
      }

      res.status(406).json({ error: true, message: 'EL token no es válido!' });
    }
  }
}

export default usersController;