import { Schema, model } from 'mongoose';
import IRutaPeaje from '../interface/IRutaPeaje';

const rutaCiudadSchema = new Schema({
  idRutaPeaje: {
    type: String,
    required: true
  },
  idRuta: {
    type: String,
    required: true,
    unique: true
  },
  idPeaje: {
    type: String,
    requied: true
  }
},
  {
    versionKey: false
  });
export default model<IRutaPeaje>('rutaPeajes', rutaCiudadSchema);