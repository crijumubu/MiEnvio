import { Document } from 'mongoose';

export default interface IFlete extends Document {
    id: number;
    toneladaKilometro: number;
	costoTonelada: number;
	costocarga: number;
	costoHoraadicional: number;
	horasEspera: number;
	costoTiempoEspera: number;
	toneladaKilometroViaje: number;
	toneladaViaje: number;
	costoKilometro: number;
	costoKilometroViaje: number;
}