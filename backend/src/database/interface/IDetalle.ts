import { Document } from 'mongoose';

export default interface IDetalle extends Document {
    idFlete: number;
    tipoCosto: string;
	concepto: string;
	mes: number;
	viaje: number;
	tonelada: number;
	participacion: number;
}