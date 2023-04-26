import { Schema, model } from 'mongoose';
import IDetalle from '../interface/IDetalle';
const detalleSchema = new Schema({
    idFlete: {
        type: Number,
        required: true
    },
    tipoCosto: {
        type: String,
        required: true
    },
    concepto: {
        type: String,
        required: true
    },
    mes: {
        type: Number,
        required: true
    },
    viaje: {
        type: Number,
        required: true
    },
    tonelada: {
        type: Number,
        required: true
    },
    participacion: {
        type: Number,
        required: true
    }
},
    {
        versionKey: false
    });
export default model<IDetalle>('detalles', detalleSchema);