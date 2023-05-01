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
const rutaModel_1 = __importDefault(require("../model/rutaModel"));
const rutapeajeModel_1 = __importDefault(require("../model/rutapeajeModel"));
const fleteModel_1 = __importDefault(require("../model/fleteModel"));
const detalleModel_1 = __importDefault(require("../model/detalleModel"));
const viajeModel_1 = __importDefault(require("../model/viajeModel"));
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
        this.getRutaOriDet = (req, res) => {
            this.ruta.obtenerRutas(Number(req.params.idOrigen), Number(req.params.idDestino), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getRutaPeajeId = (req, res) => {
            this.rutaPeaje.obtenerRutaPeaje(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getFlete = (req, res) => {
            this.flete.obtenerFleteId(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getDetalle = (req, res) => {
            this.detalle.obtenerDetallesIdFlete(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getViaje = (req, res) => {
            this.viaje.obtenerViajeIdUser(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.registerViaje = (req, res) => __awaiter(this, void 0, void 0, function* () {
            yield this.flete.registroFlete(req.body.toneladaKilometro, req.body.costoTonelada, req.body.costocarga, req.body.costoHoraadicional, req.body.horasEspera, req.body.costoTiempoEspera, req.body.toneladaKilometroViaje, req.body.toneladaViaje, req.body.costoKilometro, req.body.costoKilometroViaje, (error) => {
                if (error) {
                    return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                }
            });
            yield this.viaje.registroViaje(req.body.idUsuario, req.body.nombre, req.body.origen, req.body.destino, req.body.estado, req.body.direccion, (error) => {
                if (error) {
                    return res.status(500).json({ error: true, message: 'Registro no exitóso!' });
                }
            });
            return res.status(200).json({ error: false, message: 'Algo ha salido bien al realizar el registro!' });
        });
        this.registerDetalle = (req, res) => __awaiter(this, void 0, void 0, function* () {
            if (req.body) {
                yield this.detalle.registroDetalles(req.body.idFlete, req.body.tipoCosto, req.body.concepto, req.body.mes, req.body.viaje, req.body.tonelada, req.body.participacion, (error) => {
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
        this.updateEstado = (req, res) => __awaiter(this, void 0, void 0, function* () {
            if (req.body) {
                yield this.viaje.cambiarEstado(req.body.idViaje, req.body.estado, (error) => {
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
        this.asignarConductor = (req, res) => __awaiter(this, void 0, void 0, function* () {
            if (req.body) {
                yield this.viaje.asignarConductor(req.body.idViaje, req.body.idConductor, (error) => {
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
        this.getViajeActivo = (req, res) => {
            this.viaje.obtenerViajeActivo(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getViajeConductor = (req, res) => {
            this.viaje.obtenerViajeCondustor(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.getViajeId = (req, res) => {
            this.viaje.obtenerViajeId(Number(req.params.id), (row) => {
                if (row) {
                    res.json(row);
                }
                else {
                    return res.status(404).json({ error: true, message: 'User not found' });
                }
            });
        };
        this.detalle = new detalleModel_1.default();
        this.viaje = new viajeModel_1.default();
        this.flete = new fleteModel_1.default();
        this.rutaPeaje = new rutapeajeModel_1.default();
        this.ruta = new rutaModel_1.default();
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
