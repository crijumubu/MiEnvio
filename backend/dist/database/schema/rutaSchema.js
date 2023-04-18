"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const rutaSchema = new mongoose_1.Schema({
    idRuta: {
        type: Number,
        required: true
    },
    idCiudadOrigen: {
        type: Number,
        required: true,
        unique: true
    },
    idCiudadDestino: {
        type: Number,
        requied: true
    },
    nombreRuta: {
        type: String,
        required: true
    },
    planoRuta: {
        type: Number,
        requied: true
    },
    onduladoRuta: {
        type: Number,
        required: true
    },
    montanaRuta: {
        type: Number,
        required: true
    },
    urbanoRuta: {
        type: Number,
        required: true
    },
    despavimentadoRuta: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('rutas', rutaSchema);
