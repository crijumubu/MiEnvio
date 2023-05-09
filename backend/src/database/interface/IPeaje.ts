import { Document } from 'mongoose';

export default interface Ipeaje extends Document {
    idPeaje: number;
    nombrePeaje: string;
    sector: string;
    categoriaI: number;
    categoriaII: number;
    categoriaIII: number;
    categoriaIV: number;
    categoriaV: number;
}