"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const rutaCiudadSchema = new mongoose_1.Schema({
    idRutaPeaje: {
        type: Number,
        required: true
    },
    idRuta: {
        type: Number,
        required: true,
    },
    idPeaje: {
        type: Number,
        requied: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('rutaPeajes', rutaCiudadSchema);
