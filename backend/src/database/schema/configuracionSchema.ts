import { Schema, model } from 'mongoose';
import IConfiguracion from '../interface/IConfiguracion';

const configuracionSchema = new Schema({
  idConfiguracion: {
    type: Number,
    required: true
  },
  idVehiculoConfiguracion: {
    type: Number,
    required: true,
  },
  idCargaConfiguracion: {
    type: Number,
    requied: true
  },
  idUnidadConfiguracion: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<IConfiguracion>('configuraciones', configuracionSchema);