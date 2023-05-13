"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const peajeSchema = new mongoose_1.Schema({
    idPeaje: {
        type: Number,
        required: true
    },
    nombrePeaje: {
        type: String,
        required: true
    },
    sector: {
        type: String,
        requied: true
    },
    categoriaI: {
        type: Number,
        required: true
    },
    categoriaII: {
        type: Number,
        required: true
    },
    categoriaIII: {
        type: Number,
        required: true
    },
    categoriaIV: {
        type: Number,
        required: true
    },
    categoriaV: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('peajes', peajeSchema);
