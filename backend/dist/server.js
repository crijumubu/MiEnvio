"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importStar(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
const cors_1 = __importDefault(require("cors"));
const usersRoute_1 = __importDefault(require("./routes/usersRoute"));
const viajeRoute_1 = __importDefault(require("./routes/viajeRoute"));
class Server {
    constructor() {
        this.config = () => {
            this.backend.set('port', process.env.PORT);
            this.backend.use((0, express_1.urlencoded)({ extended: true }));
            this.backend.use((0, express_1.json)());
            this.backend.use((0, cors_1.default)());
        };
        this.route = () => {
            this.backend.use(`${process.env.USERSROUTE}`, this.userRouter.router);
            this.backend.use(`${process.env.USERSROUTE}`, this.viajeRoute.router);
        };
        this.start = () => {
            this.backend.listen(process.env.PORT, () => {
                console.log('Server on port:', process.env.PORT);
            });
        };
        dotenv_1.default.config();
        this.backend = (0, express_1.default)();
        this.userRouter = new usersRoute_1.default();
        this.viajeRoute = new viajeRoute_1.default();
        this.config();
        this.route();
        this.start();
    }
}
const server = new Server();
