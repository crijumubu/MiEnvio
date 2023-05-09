import { Document } from 'mongoose';

export default interface ICostoFijo extends Document {
    idItemFijo: number;
    idConfiguracionVehiculo: number;
    nombreItemFijo: string;
    nuevoValorItem: number;
}