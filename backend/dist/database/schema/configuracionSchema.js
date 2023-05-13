"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const configuracionSchema = new mongoose_1.Schema({
    idConfiguracion: {
        type: Number,
        required: true
    },
    idVehiculoConfiguracion: {
        type: Number,
        required: true
    },
    idCargaConfiguracion: {
        type: Number,
        requied: true
    },
    idUnidadConfiguracion: {
        type: Number,
        required: true
    },
    costoHoraAdicional: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('configuraciones', configuracionSchema);
