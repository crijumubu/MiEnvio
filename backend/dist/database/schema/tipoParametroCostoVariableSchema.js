"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const tipoParametroCostoVarible = new mongoose_1.Schema({
    idParametro: {
        type: Number,
        required: true
    },
    nombreParametro: {
        type: String,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('parametros', tipoParametroCostoVarible);
