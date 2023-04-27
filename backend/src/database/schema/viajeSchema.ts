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
    idFlete: {
        type: Number,
        required: true
    },
    idOrigen: {
        type: Number,
        required: true
    },
    idLlegada: {
        type: Number,
        required: true
    },
    estado: {
        type: Number,
        required: true
    },
    idConductor: {
        type: Number,
        required: false
    }
},
    {
        versionKey: false
    });
export default model<IViaje>('viajes', viajeSchema);