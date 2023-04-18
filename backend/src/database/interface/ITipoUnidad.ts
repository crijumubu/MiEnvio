import { Document } from 'mongoose';

export default interface ITipoUnidad extends Document {
    idTipoUnidad: number;
    nombreUnidad: string;
}