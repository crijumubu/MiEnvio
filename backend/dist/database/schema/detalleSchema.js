"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const detalleSchema = new mongoose_1.Schema({
    idFlete: {
        type: Number,
        required: true
    },
    tipoCosto: {
        type: String,
        required: true
    },
    concepto: {
        type: String,
        required: true
    },
    mes: {
        type: Number,
        required: true
    },
    viaje: {
        type: Number,
        required: true
    },
    tonelada: {
        type: Number,
        required: true
    },
    participacion: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('detalles', detalleSchema);
