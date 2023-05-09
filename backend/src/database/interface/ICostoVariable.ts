import { Document } from 'mongoose';

export default interface ICostoVariable extends Document {
    idItemVariable: number;
    idConfiguracionVehiculo: number;
    nombreItemVariable: string;
    nuevoValorItem: number;
    cantidadItemVariable: number;
    cambioItemVariable: number;
    nuevocCostoItem: number;
    idParametroItemVariable: number;
}