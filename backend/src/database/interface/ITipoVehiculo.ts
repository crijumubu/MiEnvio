import { Document } from 'mongoose';

export default interface ITipoVehiculo extends Document {
    idTipoVehiculo: number;
    nombreTipoVehiculo: string;
    descripcionVehiculo: string;
    pesoVehiculo: number;
    categoriaVehiculo: number;
}