"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const ciudadSchema = new mongoose_1.Schema({
    idCiudad: {
        type: Number,
        required: true
    },
    nombreCiudad: {
        type: String,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('ciudades', ciudadSchema);
