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
class detalleModel {
    constructor() {
        this.registroDetalles = (idFlete, tipoCosto, concepto, mes, viaje, tonelada, participacion, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            yield this.mongo.model.create({ 'idFlete': idFlete, 'tipoCosto': tipoCosto, 'concepto': concepto, 'mes': mes, 'viaje': viaje, 'tonelada': tonelada, 'participacion': participacion }).then((response, error) => {
                //console.log(response);
                //console.log(error);
                fn(error);
            });
        });
        this.obtenerDetallesIdFlete = (id, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            const rows = yield this.mongo.model.find({ 'idFlete': id });
            fn(rows);
        });
        this.mongo = new mongo_1.default(15);
        this.mongo2 = new mongo_1.default(14);
    }
}
exports.default = detalleModel;
