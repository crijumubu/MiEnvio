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
class rutaModel {
    constructor() {
        this.obtenerRutas = (idOrigen, idDestino, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            const rows = yield this.mongo.model.find({ idCiudadOrigen: idOrigen, idCiudadDestino: idDestino });
            fn(rows);
        });
        this.mongo = new mongo_1.default(9);
    }
    getRutas(idOrigen, idDestino) {
        return __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            const rows = yield this.mongo.model.find({ idCiudadOrigen: idOrigen, idCiudadDestino: idDestino });
            return (rows[0]);
        });
    }
}
exports.default = rutaModel;
