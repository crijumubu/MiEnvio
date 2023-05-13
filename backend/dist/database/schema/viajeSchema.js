"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const viajeSchema = new mongoose_1.Schema({
    idViaje: {
        type: Number,
        required: true
    },
    idUsuario: {
        type: Number,
        required: true
    },
    nombre: {
        type: String,
        required: true
    },
    origen: {
        type: String,
        required: true
    },
    destino: {
        type: String,
        required: true
    },
    estado: {
        type: Number,
        required: true
    },
    idConductor: {
        type: Number,
        required: false
    },
    direccion: {
        type: String,
        required: false
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('viajes', viajeSchema);
