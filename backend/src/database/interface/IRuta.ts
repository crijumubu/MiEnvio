import { Document } from 'mongoose';

export default interface IRuta extends Document {
    idRuta: number;
    idCiudadOrigen: number;
    nombreRuta: string;
    planoRuta: number;
    onduladoRuta: number; 
    montanaRuta: number;
    urbanoRuta: number;
    despavimentadoRuta: number;
}