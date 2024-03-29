import { Schema, model } from 'mongoose';
import ICostoFijo from '../interface/ICostoFijo';

const costoFijoSchema = new Schema({
  idItemFijo: {
    type: Number,
    required: true
  },
  idConfiguracionVehiculo: {
    type: Number,
    required: true
  },
  nombreItemFijo: {
    type: String,
    requied: true
  },
  nuevoValorItem: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<ICostoFijo>('costosfijos', costoFijoSchema);