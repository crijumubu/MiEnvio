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
    }
}
exports.default = viajeRoute;
