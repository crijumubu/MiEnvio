"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const tipoVehiculoSchema = new mongoose_1.Schema({
    idTipoVehiculo: {
        type: Number,
        required: true
    },
    nombreTipoVehiculo: {
        type: String,
        required: true
    },
    descripcionVehiculo: {
        type: String,
        required: true
    },
    pesoVehiculo: {
        type: Number,
        required: true
    },
    categoriaVehiculo: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('tipoVehiculo', tipoVehiculoSchema);
