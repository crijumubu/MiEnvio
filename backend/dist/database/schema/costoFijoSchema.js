"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const costoFijoSchema = new mongoose_1.Schema({
    idItemFijo: {
        type: Number,
        required: true
    },
    idConfiguracionVehiculo: {
        type: Number,
        required: true
    },
    nombreItemFijo: {
        type: String,
        requied: true
    },
    nuevoValorItem: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('costosfijos', costoFijoSchema);
