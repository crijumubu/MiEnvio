import { Schema, model } from 'mongoose';
import IPeaje from '../interface/IPeaje';

const peajeSchema = new Schema({
  idPeaje: {
    type: Number,
    required: true
  },
  nombrePeaje: {
    type: String,
    required: true,
  },
  sector: {
    type: String,
    requied: true
  },
  categoria1: {
    type: Number,
    required: true
  },
  categoria2: {
    type: Number,
    required: true
  },
  categoria3: {
    type: Number,
    required: true
  },
  categoria4: {
    type: Number,
    required: true
  },
  categoria5: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<IPeaje>('peajes', peajeSchema);