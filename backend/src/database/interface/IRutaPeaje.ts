import { Document } from 'mongoose';

export default interface IRutaPeaje extends Document {
    idRutaPeaje: number;
    idRuta: number;
    idPeaje: number;
}