"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const costoVariableSchema = new mongoose_1.Schema({
    idItemVariable: {
        type: Number,
        required: true
    },
    idConfiguracionVehiculo: {
        type: Number,
        required: true
    },
    nombreItemVariable: {
        type: String,
        requied: true
    },
    valorItemVariable: {
        type: Number,
        required: true
    },
    cantidadItemVariable: {
        type: Number,
        required: true
    },
    cambioItemVariable: {
        type: Number,
        required: true
    },
    costoItemVariable: {
        type: Number,
        requied: true
    },
    idParametroItemVariable: {
        type: Number,
        requied: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('costosVariables', costoVariableSchema);
