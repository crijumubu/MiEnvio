import { Schema, model } from 'mongoose';
import ICostoFijo from '../interface/ICostoFijo';

const costoFijoSchema = new Schema({
  idItemFijo: {
    type: Number,
    required: true
  },
  idConfiguracionVehiculo: {
    type: Number,
    required: true,
    unique: true
  },
  nombreItemFijo: {
    type: String,
    requied: true
  },
  valorItemFijo: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<ICostoFijo>('users', costoFijoSchema);