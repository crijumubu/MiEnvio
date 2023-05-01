"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const viajesController_1 = __importDefault(require("../controller/viajesController"));
class viajeRoute {
    constructor() {
        this.router = (0, express_1.Router)();
        this.controller = new viajesController_1.default();
        this.config();
    }
    config() {
        this.router.get('/dataInicial', this.controller.dataInicio);
        this.router.get('/peaje/:id', this.controller.getPeajeId);
        this.router.get('/costoFijo/:id', this.controller.getFijosId);
        this.router.get('/costoVariable/:id', this.controller.getVariablesId);
        this.router.get('/ruta/:idOrigen/:idDestino', this.controller.getRutaOriDet);
        this.router.get('/rutaPeaje/:id', this.controller.getRutaPeajeId);
        this.router.get('/fleteId/:id', this.controller.getFlete);
        this.router.get('/detalleId/:id', this.controller.getDetalle);
        this.router.get('/viajeIdUsr/:id', this.controller.getViaje);
        this.router.post('/registroViaje', this.controller.registerViaje);
        this.router.post('/registroDetalles', this.controller.registerDetalle);
        this.router.post('/cambioEstados', this.controller.updateEstado);
        this.router.post('/asignar', this.controller.asignarConductor);
        this.router.get('/viajeIdUsrActivo/:id', this.controller.getViajeActivo);
        this.router.get('/viajeIdConductor/:id', this.controller.getViajeConductor);
        this.router.get('/viajeId/:id', this.controller.getViajeId);
        this.router.post('/registroFlete', this.controller.registerFlete);
    }
}
exports.default = viajeRoute;
