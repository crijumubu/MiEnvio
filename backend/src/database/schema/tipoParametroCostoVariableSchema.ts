import { Schema, model } from 'mongoose';
import ITipoParametroCostoVariable from '../interface/ITipoParametroCostoVariable';

const tipoParametroCostoVarible = new Schema({
  idParametro: {
    type: String,
    required: true
  },
  nombreParametro: {
    type: String,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<ITipoParametroCostoVariable>('tipoParametroCostoVariable', tipoParametroCostoVarible);