"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const promedioVelocidadSchema = new mongoose_1.Schema({
    idVelocidad: {
        type: Number,
        required: true
    },
    idVehiculoVelocidad: {
        type: Number,
        required: true
    },
    plano: {
        type: Number,
        requied: true
    },
    ondulado: {
        type: Number,
        required: true
    },
    montana: {
        type: Number,
        required: true
    },
    urbano: {
        type: Number,
        required: true
    },
    despavimentado: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('velocidadPromedio', promedioVelocidadSchema);
