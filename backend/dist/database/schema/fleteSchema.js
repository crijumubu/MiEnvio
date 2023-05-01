"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const fleteSchema = new mongoose_1.Schema({
    id: {
        type: Number,
        required: true
    },
    idViaje: {
        type: Number,
        required: true
    },
    toneladaKilometro: {
        type: Number,
        required: true
    },
    costoTonelada: {
        type: Number,
        required: true
    },
    costocarga: {
        type: Number,
        required: true
    },
    costoHoraadicional: {
        type: Number,
        required: true
    },
    horasEspera: {
        type: Number,
        required: true
    },
    costoTiempoEspera: {
        type: Number,
        required: true
    },
    toneladaKilometroViaje: {
        type: Number,
        required: true
    },
    toneladaViaje: {
        type: Number,
        required: true
    },
    costoKilometro: {
        type: Number,
        required: true
    },
    costoKilometroViaje: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('fletes', fleteSchema);
