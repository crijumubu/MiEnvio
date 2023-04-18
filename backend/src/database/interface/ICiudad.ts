import { Document } from 'mongoose';

export default interface ICiudad extends Document {
    idCiudad: number;
    nombreCiudad: string;
}