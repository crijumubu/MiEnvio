"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const tipoCargaSchema = new mongoose_1.Schema({
    idTipoCarga: {
        type: Number,
        required: true
    },
    nombreTipoCarga: {
        type: String,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('cargas', tipoCargaSchema);
