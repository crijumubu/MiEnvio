import { Schema, model } from 'mongoose';
import IViaje from '../interface/IViaje';
const viajeSchema = new Schema({
    idViaje: {
        type: Number,
        required: true
    },
    idUsuario: {
        type: Number,
        required: true
    },
    
    nombre: {
        type: String,
        required: true
    },
    origen: {
        type: String,
        required: true
    },
    destino: {
        type: String,
        required: true
    },
    estado: {
        type: Number,
        required: true
    },
    idConductor: {
        type: Number,
        required: false
    },
    direccion: {
        type: String,
        required: false
    }
},
    {
        versionKey: false
    });
export default model<IViaje>('viajes', viajeSchema);