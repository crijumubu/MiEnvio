import { Document } from 'mongoose';

export default interface ITipoParametroCostoVariable extends Document {
    idParametro: number;
    nombreParametro: string;
}