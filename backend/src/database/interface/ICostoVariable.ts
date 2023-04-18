import { Document } from 'mongoose';

export default interface ICostoVariable extends Document {
    idItemVariable: number;
    idConfiguracionVehiculo: number;
    nombreItemVariable: string;
    valorItemVariable: number; 
    cantidadItemVariable: number;
    cambioItemVariable: number;
    costoItemVariableKm: number;
    idParametroItemVariable: number;
}