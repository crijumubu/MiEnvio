import { Schema, model } from 'mongoose';
import ItipoVehiculo from '../interface/ITipoVehiculo';

const tipoVehiculoSchema = new Schema({
  idTipoVehiculo: {
    type: Number,
    required: true
  },
  nombreTipoVehiculo: {
    type: String,
    required: true
  },
  descripcionVehiculo: {
    type: String,
    required: true
  },
  pesoVehiculo: {
    type: Number,
    required: true
  },
  categoriaVehiculo: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<ItipoVehiculo>('tipoVehiculo', tipoVehiculoSchema);