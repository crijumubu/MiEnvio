import mongo from '../database/mongo';
class detalleModel {
    private mongo: mongo;
    private mongo2: mongo;
    constructor() {
        this.mongo = new mongo(15);
        this.mongo2 = new mongo(14);
    }
    public registroDetalles = async (idFlete: number, tipoCosto: number, concepto: string, mes: number, viaje: number, tonelada: number, participacion: number, fn: any) => {
        this.mongo.connect();
        await this.mongo.model.create({ 'idFlete': idFlete, 'tipoCosto': tipoCosto, 'concepto': concepto, 'mes': mes, 'viaje': viaje, 'tonelada': tonelada, 'participacion': participacion }).then(
            (response: any, error: any) => {
                //console.log(response);
                //console.log(error);
                fn(error);
            }
        )
    }
    public obtenerDetallesIdFlete = async (id: number, fn: any) => {
        this.mongo.connect();
        const rows = await this.mongo.model.find({ 'idFlete': id });
        fn(rows);
    }
}
export default detalleModel;