import { Document } from 'mongoose';

export default interface IViaje extends Document {
    idViaje: number;
    idUsuario:number;
    nombre:string;
    idFlete:number;
    idOrigen:number;
    idLlegada:number;
    estado:number
}