import mongo from '../database/mongo';
class viajeModel {
    private mongo: mongo;
    private mongo2: mongo;
    constructor() {
        this.mongo = new mongo(16);
        this.mongo2 = new mongo(14);
    }
    public registroViaje = async (idUsuario: number, nombre: string, idOrigen: number, idLlegada: number, estado: number, fn: any) => {
        this.mongo.connect();
        let cantviajes = -1
        try {
            await this.mongo.model.aggregate([
                {
                    $group:
                    {
                        '_id': null,
                        'nid': { $max: '$idViaje' },
                    }
                }
            ]).then((response: any, error: any) => {
                cantviajes = response[0].nid + 1;
            });
        }
        catch (err) {
            console.log(err);
            cantviajes = 1;
        }
        let cantf = -1
        try {
            await this.mongo2.model.aggregate([
                {
                    $group:
                    {
                        '_id': null,
                        'nid': { $max: '$id' },
                    }
                }
            ]).then((response: any, error: any) => {
                cantf = response[0].nid;
            });
        } catch (err) {
            console.log(err);
            cantf = 1;
        }
        await this.mongo.model.create({ 'idViaje': cantviajes, 'idUsuario': idUsuario, 'nombre': nombre, 'idFlete': cantf, 'idOrigen': idOrigen, 'idLlegada': idLlegada, 'estado': estado ,'idConductor':0})
            .then((response: any, error: any) => {
                //console.log(response);
                //console.log(error);
                fn(error);
            })
    }
    public obtenerViajeIdUser = async (id: number, fn: any) => {
        this.mongo.connect();
        const rows = await this.mongo.model.find({ idCiudad: id });
        fn(rows);
    }
}
export default viajeModel;