"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const usersSchema = new mongoose_1.Schema({
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        requied: true
    }
}, {
    versionKey: false
});
exports.default = (0, mongoose_1.model)('users', usersSchema);
