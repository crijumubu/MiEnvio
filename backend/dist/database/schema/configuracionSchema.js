"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const configuracionSchema = new mongoose_1.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        requied: true
    },
    userType: {
        type: Number,
        required: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('configuraciones', configuracionSchema);
