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
    nombreCiudad: {
        type: String,
        required: true
    },
    nombre: {
        type: Number,
        required: true
    },
    idFlete: {
        type: Number,
        required: true
    },
    idOrigen: {
        type: Number,
        required: true
    },
    idLlegada: {
        type: Number,
        required: true
    },
    estado: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('viajes', viajeSchema);
