import { Document } from 'mongoose';

export default interface ITipoCarga extends Document {
    idTipoCarga: number;
    nombreTipoCarga: string;
}