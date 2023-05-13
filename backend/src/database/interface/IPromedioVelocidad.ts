import { Document } from 'mongoose';

export default interface IPromedioVelocidad extends Document {
    idVelocidad: number;
    idVehiculoVelocidad: number;
    plano: number;
    ondulado: number;
    montana: number;
    urbano: number;
    despavimentado: number;
}