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
const mongo_1 = __importDefault(require("../database/mongo"));
class viajeModel {
    constructor() {
        this.registroViaje = (idUsuario, nombre, idOrigen, idLlegada, estado, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            let cantviajes = -1;
            try {
                yield this.mongo.model.aggregate([
                    {
                        $group: {
                            '_id': null,
                            'nid': { $max: '$idViaje' },
                        }
                    }
                ]).then((response, error) => {
                    cantviajes = response[0].nid + 1;
                });
            }
            catch (err) {
                console.log(err);
                cantviajes = 1;
            }
            let cantf = -1;
            try {
                yield this.mongo2.model.aggregate([
                    {
                        $group: {
                            '_id': null,
                            'nid': { $max: '$id' },
                        }
                    }
                ]).then((response, error) => {
                    cantf = response[0].nid;
                });
            }
            catch (err) {
                console.log(err);
                cantf = 1;
            }
            yield this.mongo.model.create({ 'idViaje': cantviajes, 'idUsuario': idUsuario, 'nombre': nombre, 'idFlete': cantf, 'idOrigen': idOrigen, 'idLlegada': idLlegada, 'estado': estado, 'idConductor': 0 })
                .then((response, error) => {
                //console.log(response);
                //console.log(error);
                fn(error);
            });
        });
        this.obtenerViajeIdUser = (id, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            const rows = yield this.mongo.model.find({ idCiudad: id });
            fn(rows);
        });
        this.mongo = new mongo_1.default(16);
        this.mongo2 = new mongo_1.default(14);
    }
}
exports.default = viajeModel;
