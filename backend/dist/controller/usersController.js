"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const usersModel_1 = __importDefault(require("../model/usersModel"));
const jwt = require('jsonwebtoken');
class usersController {
    constructor() {
        this.login = (req, res) => {
            const { email, password } = req.body;
            this.model.login(email, password, (status, userType, idUser) => {
                switch (status) {
                    case 1: {
                        const token = jwt.sign({ email: email }, process.env.TOKEN_SECRET, { expiresIn: '1d', algorithm: 'HS256' });
                        res.header('auth-token', token).json({ error: null, data: { email, token, userType, idUser } });
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
        };
        this.register = (req, res) => {
            const { name, email, password, userType } = req.body;
            this.model.register(name, email, password, userType, (error) => {
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
        };
        this.verifyToken = (req, res, next) => {
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
        };
        this.getUserData = (req, res) => {
            this.model.getNombre(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.updateUser = (req, res) => __awaiter(this, void 0, void 0, function* () {
            if (req.body) {
                yield this.model.updateUser(req.body.id, req.body.name, req.body.email, req.body.password, (error) => {
                    if (error) {
                        return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                    }
                });
            }
            else {
                return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
            }
            return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
        });
        this.model = new usersModel_1.default();
    }
}
exports.default = usersController;
