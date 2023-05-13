import { Schema, model } from 'mongoose';
import IPromedioVelocidad from '../interface/IPromedioVelocidad';

const promedioVelocidadSchema = new Schema({
  idVelocidad: {
    type: Number,
    required: true
  },
  idVehiculoVelocidad: {
    type: Number,
    required: true
  },
  plano: {
    type: Number,
    requied: true
  },
  ondulado: {
    type: Number,
    required: true
  },
  montana: {
    type: Number,
    required: true
  },
  urbano: {
    type: Number,
    required: true
  },
  despavimentado: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<IPromedioVelocidad>('velocidades', promedioVelocidadSchema);