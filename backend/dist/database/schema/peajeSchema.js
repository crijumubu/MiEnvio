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
    categoria1: {
        type: Number,
        required: true
    },
    categoria2: {
        type: Number,
        required: true
    },
    categoria3: {
        type: Number,
        required: true
    },
    categoria4: {
        type: Number,
        required: true
    },
    categoria5: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('peajes', peajeSchema);
