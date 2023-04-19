"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongo_1 = __importDefault(require("../database/mongo"));
class tipoVehiculoModel {
    constructor() {
        this.mongo = new mongo_1.default(13);
    }
}
exports.default = tipoVehiculoModel;
