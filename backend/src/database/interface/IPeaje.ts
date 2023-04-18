import { Document } from 'mongoose';

export default interface Ipeaje extends Document {
    idPeaje: number;
    nombrePeaje: string;
    sector: string;
    categoria1: number;
    categoria2: number;
    categoria3: number;
    categoria4: number;
    categoria5: number;
}