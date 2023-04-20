"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const ciudadModel_1 = __importDefault(require("../model/ciudadModel"));
class viajeRoute {
    constructor() {
        this.router = (0, express_1.Router)();
        this.controller = new ciudadModel_1.default();
        this.config();
    }
    config() {
        // this.router.get('/ciudades', this.controller.idCiudad);
    }
}
exports.default = viajeRoute;
