import { Schema, model } from 'mongoose';
import IRuta from '../interface/IRuta';

const rutaSchema = new Schema({
  idRuta: {
    type: Number,
    required: true
  },
  idCiudadOrigen: {
    type: Number,
    required: true,
    unique: true
  },
  idCiudadDestino: {
    type: Number,
    requied: true
  },
  nombreRuta: {
    type: String,
    required: true
  },
  planoRuta: {
    type: Number,
    requied: true
  },
  onduladoRuta: {
    type: Number,
    required: true
  },
  montanaRuta: {
    type: Number,
    required: true
  },
  urbanoRuta: {
    type: Number,
    required: true
  },
  despavimentadoRuta: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<IRuta>('rutas', rutaSchema);