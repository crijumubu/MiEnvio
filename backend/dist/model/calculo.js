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
const rutaModel_1 = __importDefault(require("../model/rutaModel"));
const configuracionModel_1 = __importDefault(require("../model/configuracionModel"));
const promedioVelocidadModel_1 = __importDefault(require("../model/promedioVelocidadModel"));
const costoFijoModel_1 = __importDefault(require("../model/costoFijoModel"));
const tipoVehiculoModel_1 = __importDefault(require("../model/tipoVehiculoModel"));
const costoVariableModel_1 = __importDefault(require("../model/costoVariableModel"));
const promedioConsumoModel_1 = __importDefault(require("../model/promedioConsumoModel"));
const rutapeajeModel_1 = __importDefault(require("../model/rutapeajeModel"));
const peajeModel_1 = __importDefault(require("../model/peajeModel"));
class calculo {
    constructor() {
        this.peaje = new peajeModel_1.default();
        this.rutapeaje = new rutapeajeModel_1.default();
        this.consumos = new promedioConsumoModel_1.default();
        this.variables = new costoVariableModel_1.default();
        this.vehiculo = new tipoVehiculoModel_1.default();
        this.fijos = new costoFijoModel_1.default();
        this.ciudad = new ciudadModel_1.default();
        this.ruta = new rutaModel_1.default();
        this.configuracion = new configuracionModel_1.default();
        this.velocidades = new promedioVelocidadModel_1.default();
    }
    horasViaje(ruta, velocidades, espera) {
        const horasViaje = (ruta.planoRuta / velocidades.plano) + (ruta.onduladoRuta / velocidades.ondulado) + (ruta.montanaRuta / velocidades.montana) + (ruta.urbanoRuta / velocidades.urbano) + (ruta.despavimentadoRuta / velocidades.despavimentado);
        const horasRecorrido = horasViaje + espera;
        const recorridosMes = 288 / horasViaje;
        const recorridosConEsperaMes = 288 / horasRecorrido;
        return [horasRecorrido, recorridosMes, recorridosConEsperaMes];
    }
    calcularFijos(items, viajes, peso) {
        const nombres = [];
        const valoresViaje = [];
        const valoresTonelada = [];
        for (let index = 0; index < items.length; index++) {
            nombres.push(items[index].nombreItemFijo);
            valoresViaje.push(items[index].nuevoValorItem / viajes);
            valoresTonelada.push(items[index].nuevoValorItem / (viajes * peso));
        }
        return { 'nombresItems': nombres, 'valoresViaje': valoresViaje, 'ValoresXton': valoresTonelada };
    }
    combustible(ruta, consumos) {
        const res = 9357 * ((ruta.planoRuta / consumos.plano) + (ruta.onduladoRuta / consumos.ondulado) + (ruta.montanaRuta / consumos.montana) + (ruta.urbanoRuta / consumos.urbano) + (ruta.despavimentadoRuta / consumos.despavimentado));
        return res;
    }
    peajes(listaPeajes, categoria) {
        return __awaiter(this, void 0, void 0, function* () {
            let total = 0;
            switch (categoria) {
                case 2:
                    for (let index = 0; index < listaPeajes.length; index++) {
                        const temp = yield this.peaje.getPeaje(listaPeajes[index].idPeaje);
                        total = total + temp.categoriaII;
                    }
                    break;
                case 3:
                    for (let index = 0; index < listaPeajes.length; index++) {
                        const temp = yield this.peaje.getPeaje(listaPeajes[index].idPeaje);
                        total = total + temp.categoriaIII;
                    }
                    break;
                case 4:
                    for (let index = 0; index < listaPeajes.length; index++) {
                        const temp = yield this.peaje.getPeaje(listaPeajes[index].idPeaje);
                        total = total + temp.categoriaIV;
                    }
                    break;
                case 5:
                    for (let index = 0; index < listaPeajes.length; index++) {
                        const temp = yield this.peaje.getPeaje(listaPeajes[index].idPeaje);
                        total = total + temp.categoriaV;
                    }
                    break;
                default:
                    break;
            }
            return total;
        });
    }
    calcularVariables(items, kms, peso) {
        let llantas = 0;
        let lubricantes = 0;
        let filtros = 0;
        let mantenimiento = 0;
        let lavado = 0;
        for (let index = 0; index < items.length; index++) {
            const element = items[index].idParametroItemVariable;
            switch (element) {
                case 1:
                    llantas = llantas + (items[index].nuevocCostoItem * kms);
                    break;
                case 2:
                    lubricantes = lubricantes + (items[index].nuevocCostoItem * kms);
                    break;
                case 3:
                    filtros = filtros + (items[index].nuevocCostoItem * kms);
                    break;
                case 4:
                    mantenimiento = mantenimiento + (items[index].nuevocCostoItem * kms);
                    break;
                case 5:
                    lavado = lavado + (items[index].nuevocCostoItem * kms);
                    break;
                default:
                    break;
            }
        }
        return { 'llantas': [llantas, llantas / peso], 'lubricantes': [lubricantes, lubricantes / peso], 'filtros': [filtros, filtros / peso], 'mantenimiento': [mantenimiento, mantenimiento / peso], 'lavado': [lavado, lavado / peso] };
    }
    calcular(configuracion, origen, destino, horas) {
        return __awaiter(this, void 0, void 0, function* () {
            const idO = yield this.ciudad.ciudadNombre(origen);
            const idD = yield this.ciudad.ciudadNombre(destino);
            //console.log(idO,idD)
            const ruta = yield this.ruta.getRutas(idO, idD);
            //console.log(ruta);
            const config = yield this.configuracion.configuracion(configuracion);
            const idVehiculo = yield config.idVehiculoConfiguracion;
            const infoVahiculo = yield this.vehiculo.vehiculoInfo(1);
            //console.log(infoVahiculo)
            //console.log(idVehiculo);
            const velocidades = yield this.velocidades.velocidadVehiculo(idVehiculo);
            //console.log(velocidades);
            const horasViaje = yield this.horasViaje(ruta, velocidades, horas);
            //console.log(horasViaje[2]);
            const fijosViaje = yield this.fijos.Getfijos(configuracion);
            //console.log(fijosViaje[0].nuevoValorItem)
            const valoresFijos = yield this.calcularFijos(fijosViaje, horasViaje[2], infoVahiculo[0].pesoVehiculo);
            //console.log(valoresFijos);
            const consumop = yield this.consumos.getConsumos(idVehiculo);
            const costoCombustible = yield this.combustible(ruta, consumop);
            //console.log(costoCombustible)
            const rutapeaje = yield this.rutapeaje.getRutaPeaje(ruta.idRuta);
            //console.log(rutapeaje)
            const costoPeaje = yield this.peajes(rutapeaje, infoVahiculo[0].categoriaVehiculo);
            //console.log(costoPeaje)
            const itemsVariables = yield this.variables.getVariables(configuracion);
            const costoVariables = yield this.calcularVariables(itemsVariables, 399.8, infoVahiculo[0].pesoVehiculo);
            //console.log(costoVariables)
            let totalFijos = 0;
            for (let index = 0; index < valoresFijos.valoresViaje.length; index++) {
                const element = valoresFijos.valoresViaje[index];
                totalFijos = totalFijos + element;
            }
            const imprevistos = 0.075 * (costoVariables.llantas[0] + costoVariables.lubricantes[0] + costoVariables.filtros[0] + costoVariables.mantenimiento[0] + costoVariables.lavado[0]);
            //console.log(imprevistos)
            const subtotalVariables = imprevistos + costoVariables.llantas[0] + costoVariables.lubricantes[0] + costoVariables.filtros[0] + costoVariables.mantenimiento[0] + costoVariables.lavado[0] + costoPeaje + costoCombustible;
            //console.log(subtotalVariables);
            const comisiones = (subtotalVariables + totalFijos) * 0.124552;
            const admin = (subtotalVariables + totalFijos) * 0.05;
            const ica = (subtotalVariables + totalFijos) * 0.013;
            const otos = (comisiones + admin + ica);
            const totalopercaion = subtotalVariables + totalFijos + otos;
            //console.log(ruta.planoRuta)
            const costoTiempoEspera = config.costoHoraAdicional * horas;
            const costoMovil = totalopercaion - costoTiempoEspera;
            const costoTonmovil = costoMovil / infoVahiculo[0].pesoVehiculo;
            const costoTonKm = costoTonmovil / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta);
            const costoTonViaje = totalopercaion / infoVahiculo[0].pesoVehiculo;
            const costoKmViaje = totalopercaion / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta);
            const costoTonKmViaje = costoTonViaje / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta);
            const costoKmMovil = costoMovil / (ruta.planoRuta + ruta.onduladoRuta + ruta.montanaRuta + ruta.urbanoRuta + ruta.despavimentadoRuta);
            //console.log(costoKmMovil);
            return {
                'resumen': [
                    {
                        'costoTotalViaje': totalopercaion,
                        'costoTiempoEspera': costoTiempoEspera,
                        'costoMovilizacionCarga': costoMovil,
                        'horasEspera': horas,
                        'costoHoraAdicional': config.costoHoraAdicional,
                        'costoToneladaMovilizacion': costoTonmovil,
                        'costoTonKmMovilizacion': costoTonKm,
                        'costoToneladaViaje': costoTonViaje,
                        'costotoneladaKmViaje': costoTonKmViaje,
                        'costoKmViaje': costoKmViaje,
                        'costoKmMovilizacion': costoKmMovil
                    }
                ]
            };
        });
    }
}
exports.default = calculo;
