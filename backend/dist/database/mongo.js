"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const userSchema_1 = __importDefault(require("./schema/userSchema"));
const ciudadSchema_1 = __importDefault(require("./schema/ciudadSchema"));
const configuracionSchema_1 = __importDefault(require("./schema/configuracionSchema"));
const costoFijoSchema_1 = __importDefault(require("./schema/costoFijoSchema"));
const costoVariableSchema_1 = __importDefault(require("./schema/costoVariableSchema"));
const peajeSchema_1 = __importDefault(require("./schema/peajeSchema"));
const promedioConsumoSchema_1 = __importDefault(require("./schema/promedioConsumoSchema"));
const promedioVelocidadSchema_1 = __importDefault(require("./schema/promedioVelocidadSchema"));
const rutaPeajeSchema_1 = __importDefault(require("./schema/rutaPeajeSchema"));
const rutaSchema_1 = __importDefault(require("./schema/rutaSchema"));
const tipoCargaSchema_1 = __importDefault(require("./schema/tipoCargaSchema"));
const tipoParametroCostoVariableSchema_1 = __importDefault(require("./schema/tipoParametroCostoVariableSchema"));
const tipoUnidadSchema_1 = __importDefault(require("./schema/tipoUnidadSchema"));
const tipoVehiculoSchema_1 = __importDefault(require("./schema/tipoVehiculoSchema"));
class mongo {
    constructor(indexSchema) {
        this.schemasList = [userSchema_1.default, ciudadSchema_1.default, configuracionSchema_1.default, costoFijoSchema_1.default, costoVariableSchema_1.default, peajeSchema_1.default, promedioConsumoSchema_1.default, promedioVelocidadSchema_1.default, rutaPeajeSchema_1.default, rutaSchema_1.default, tipoCargaSchema_1.default, tipoParametroCostoVariableSchema_1.default, tipoUnidadSchema_1.default, tipoVehiculoSchema_1.default];
        this.connect = () => {
            mongoose_1.default.set('strictQuery', true);
            mongoose_1.default.connect(this.uri)
                .then(() => {
                console.log('Connected to MongoDB Atlas');
            })
                .catch(error => {
                console.error('Error connecting to MongoDB Atlas: ', error);
                return process.exit(1);
            });
        };
        this.uri = `${process.env.MONGODB}`;
        this.model = this.schemasList[indexSchema];
    }
}
exports.default = mongo;
