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
const ciudadModel_1 = __importDefault(require("../model/ciudadModel"));
const configuracionModel_1 = __importDefault(require("../model/configuracionModel"));
const promedioConsumoModel_1 = __importDefault(require("../model/promedioConsumoModel"));
const promedioVelocidadModel_1 = __importDefault(require("../model/promedioVelocidadModel"));
const tipoCargaModel_1 = __importDefault(require("../model/tipoCargaModel"));
const tipoParametroCostoVariable_1 = __importDefault(require("../model/tipoParametroCostoVariable"));
const tipoUnidadModel_1 = __importDefault(require("../model/tipoUnidadModel"));
const tipoVehiculoModel_1 = __importDefault(require("../model/tipoVehiculoModel"));
const peajeModel_1 = __importDefault(require("../model/peajeModel"));
const costoFijoModel_1 = __importDefault(require("../model/costoFijoModel"));
const costoVariableModel_1 = __importDefault(require("../model/costoVariableModel"));
class viajesController {
    constructor() {
        this.dataInicio = (req, res) => __awaiter(this, void 0, void 0, function* () {
            let data;
            data = '';
            yield this.ciudad.obtenerCiudades((row) => {
                if (row) {
                    data = data + '{"ciudades":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.vehiculo.obtenerVehiculos((row) => {
                if (row) {
                    data = data + '"vehiculos":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.carga.obtenerCargas((row) => {
                if (row) {
                    data = data + '"cargas":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.unidad.obtenerUnidades((row) => {
                if (row) {
                    data = data + '"unidades":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.configuracion.obtenerConfiguraciones((row) => {
                if (row) {
                    data = data + '"configuraciones":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.velocidad.obtenerVelocidades((row) => {
                if (row) {
                    data = data + '"velocidades":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.consumo.obtenerConsumos((row) => {
                if (row) {
                    data = data + '"consumos":' + JSON.stringify(row) + ',';
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
            yield this.parametro.obtenerParametros((row) => {
                if (row) {
                    data = data + '"parametros":' + JSON.stringify(row) + '}';
                    res.json(JSON.parse(data.toString()));
                    //console.log(data);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        });
        this.getPeajeId = (req, res) => {
            this.peaje.optenerPeaje(Number(req.params.id), (row) => {
                console.log(row);
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getFijosId = (req, res) => {
            this.costoFijo.obtenerCostosFijos(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getVariablesId = (req, res) => {
            this.costoVariable.obtenerCostosVariables(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.costoVariable = new costoVariableModel_1.default();
        this.costoFijo = new costoFijoModel_1.default();
        this.peaje = new peajeModel_1.default();
        this.ciudad = new ciudadModel_1.default();
        this.configuracion = new configuracionModel_1.default();
        this.consumo = new promedioConsumoModel_1.default();
        this.velocidad = new promedioVelocidadModel_1.default();
        this.carga = new tipoCargaModel_1.default();
        this.parametro = new tipoParametroCostoVariable_1.default();
        this.unidad = new tipoUnidadModel_1.default();
        this.vehiculo = new tipoVehiculoModel_1.default();
    }
}
exports.default = viajesController;
