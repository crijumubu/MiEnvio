"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const productsSchema = new mongoose_1.Schema({
    id: {
        type: Number,
        required: true
    },
    name: {
        type: String,
        required: true
    },
    brand: {
        type: String,
        required: true
    },
    rate: {
        type: Number,
        required: true
    },
    image: {
        type: String,
        required: true
    }
});
exports.default = (0, mongoose_1.model)('articles', productsSchema);
