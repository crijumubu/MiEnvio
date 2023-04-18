import { Schema, model } from 'mongoose';
import IRutaPeaje from '../interface/IRutaPeaje';

const rutaCiudadSchema = new Schema({
  idRutaPeaje: {
    type: Number,
    required: true
  },
  idRuta: {
    type: Number,
    required: true,
  },
  idPeaje: {
    type: Number,
    requied: true
  }
},
  {
    versionKey: false
  });
export default model<IRutaPeaje>('rutaPeajes', rutaCiudadSchema);