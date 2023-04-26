import { Schema, model } from 'mongoose';
import IFlete from '../interface/IFlete';
const fleteSchema = new Schema({
    id: {
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
},
    {
        versionKey: false
    });
export default model<IFlete>('fletes', fleteSchema);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   