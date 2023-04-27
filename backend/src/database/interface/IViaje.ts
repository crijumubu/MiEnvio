import { Document } from 'mongoose';

export default interface IViaje extends Document {
    idViaje: number;
    idUsuario:number;
    nombre:string;
    idFlete:number;
    origen:string;
    destino:string;
    estado:number;
    idConductor: number;
}