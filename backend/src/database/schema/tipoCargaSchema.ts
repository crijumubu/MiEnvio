import { Schema, model } from 'mongoose';
import ITipoCarga from '../interface/ITipoCarga';

const tipoCargaSchema = new Schema({
  idTipoCarga: {
    type: Number,
    required: true
  },
  nombreTipoCarga: {
    type: String,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<ITipoCarga>('cargas', tipoCargaSchema);