import { Document } from 'mongoose';

export default interface IViaje extends Document {
    idViaje: number;
    idUsuario:number;
    nombre:string;
    origen:string;
    destino:string;
    estado:number;
    idConductor: number;
    direccion: string;
}