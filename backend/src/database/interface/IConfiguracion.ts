import { Document } from 'mongoose';

export default interface IConfiguracion extends Document {
    idConfiguracion: number;
    idVehiculoConfiguracion: number;
    idCargaConfiguracion: number;
    idUnidadConfiguracion: number;
}