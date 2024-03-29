import { Schema, model } from 'mongoose';
import ICiudad from '../interface/ICiudad';

const ciudadSchema = new Schema({
    idCiudad: {
        type: Number,
        required: true
    },
    nombreCiudad: {
        type: String,
        required: true
    }
},
    {
        versionKey: false
    });
export default model<ICiudad>('ciudades', ciudadSchema);