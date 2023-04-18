"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const rutaCiudadSchema = new mongoose_1.Schema({
    idRutaPeaje: {
        type: String,
        required: true
    },
    idRuta: {
        type: String,
        required: true,
        unique: true
    },
    idPeaje: {
        type: String,
        requied: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('rutaPeajes', rutaCiudadSchema);
