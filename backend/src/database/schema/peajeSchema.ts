import { Schema, model } from 'mongoose';
import IPeaje from '../interface/IPeaje';

const peajeSchema = new Schema({
  idPeaje: {
    type: Number,
    required: true
  },
  nombrePeaje: {
    type: String,
    required: true
  },
  sector: {
    type: String,
    requied: true
  },
  categoriaI: {
    type: Number,
    required: true
  },
  categoriaII: {
    type: Number,
    required: true
  },
  categoriaIII: {
    type: Number,
    required: true
  },
  categoriaIV: {
    type: Number,
    required: true
  },
  categoriaV: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<IPeaje>('peajes', peajeSchema);