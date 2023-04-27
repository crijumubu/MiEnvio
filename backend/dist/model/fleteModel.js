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
class fleteModel {
    constructor() {
        this.registroFlete = (toneladaKilometro, costoTonelada, costocarga, costoHoraadicional, horasEspera, costoTiempoEspera, toneladaKilometroViaje, toneladaViaje, costoKilometro, costoKilometroViaje, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            let cant = 0;
            try {
                yield this.mongo.model.aggregate([
                    {
                        $group: {
                            '_id': null,
                            'nid': { $max: '$id' },
                        }
                    }
                ]).then((response, error) => {
                    cant = response[0].nid + 1;
                });
            }
            catch (err) {
                cant = 1;
                console.log(err);
            }
            yield this.mongo.model.create({ 'id': cant, 'toneladaKilometro': toneladaKilometro, 'costoTonelada': costoTonelada, 'costocarga': costocarga, 'costoHoraadicional': costoHoraadicional, 'horasEspera': horasEspera, 'costoTiempoEspera': costoTiempoEspera, 'toneladaKilometroViaje': toneladaKilometroViaje, 'toneladaViaje': toneladaViaje, 'costoKilometro': costoKilometro, 'costoKilometroViaje': costoKilometroViaje })
                .then((response, error) => {
                //console.log(response);
                //console.log(error);
                fn(error);
            });
        });
        this.obtenerFleteId = (id, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            const rows = yield this.mongo.model.find({ idCiudad: id });
            fn(rows);
        });
        this.mongo = new mongo_1.default(14);
    }
    idflete() {
        return __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            let cant = -1;
            this.mongo.model.aggregate([
                {
                    $group: {
                        '_id': null,
                        'nid': { $max: '$id' },
                    }
                }
            ]).then((response, error) => {
                cant = response[0].nid;
            });
            return cant;
        });
    }
}
exports.default = fleteModel;
