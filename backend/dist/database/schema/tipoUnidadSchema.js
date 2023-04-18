"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const tipoUnidad = new mongoose_1.Schema({
    idTipoUnidad: {
        type: String,
        required: true
    },
    nombreUnidad: {
        type: String,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('tipoUnidad', tipoUnidad);
