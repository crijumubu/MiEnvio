import { Schema, model } from 'mongoose';
import ITipoUnidad from '../interface/ITipoUnidad';

const tipoUnidad = new Schema({
  idTipoUnidad: {
    type: Number,
    required: true
  },
  nombreUnidad: {
    type: String,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<ITipoUnidad>('tipoUnidad', tipoUnidad);