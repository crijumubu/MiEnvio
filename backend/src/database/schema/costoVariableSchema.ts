import { Schema, model } from 'mongoose';
import ICostoVariable from '../interface/ICostoVariable';

const costoVariableSchema = new Schema({
  idItemVariable: {
    type: Number,
    required: true
  },
  idConfiguracionVehiculo: {
    type: Number,
    required: true
  },
  nombreItemVariable: {
    type: String,
    requied: true
  },
  nuevoValorItem: {
    type: Number,
    required: true
  },
  cantidadItemVariable: {
    type: Number,
    required: true
  },
  cambioItemVariable: {
    type: Number,
    required: true
  },
  nuevocCostoItem: {
    type: Number,
    requied: true
  },
  idParametroItemVariable: {
    type: Number,
    requied: true
  }
},
  {
    versionKey: false
  });
export default model<ICostoVariable>('costosvariables', costoVariableSchema);