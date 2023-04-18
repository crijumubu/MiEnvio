import { Schema, model } from 'mongoose';
import IConfiguracion from '../interface/IConfiguracion';

const configuracionSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  email: {
    type: String,
    required: true,
    unique: true
  },
  password: {
    type: String,
    requied: true
  },
  userType: {
    type: Number,
    required: true
  }
},
  {
    versionKey: false
  });
export default model<IConfiguracion>('configuraciones', configuracionSchema);