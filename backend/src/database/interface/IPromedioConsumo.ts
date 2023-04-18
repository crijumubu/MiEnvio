import { Document } from 'mongoose';

export default interface IPromedioConsumo extends Document {
    idConsumo: number;
    idVehiculoConsumo: number;
    plano: number;
    ondulado: number; 
    montana: number;
    urbano: number;
    despavimentado: number;
}