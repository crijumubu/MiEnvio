import { Schema, model } from 'mongoose';
import IPromedioConsumo from '../interface/IPromedioConsumo';

const promedioConsumoSchema = new Schema({
  idConsumo: {
    type: Number,
    required: true
  },
  idVehiculoConsumo: {
    type: Number,
    required: true,
    unique: true
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
export default model<IPromedioConsumo>('promedioConsumo', promedioConsumoSchema);