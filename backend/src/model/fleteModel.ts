import mongo from '../database/mongo';
class fleteModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(14);
  }
  public registroFlete = async (idViaje:number,toneladaKilometro: number, costoTonelada: number, costocarga: number, costoHoraadicional: number, horasEspera: number, costoTiempoEspera: number, toneladaKilometroViaje: number, toneladaViaje: number, costoKilometro: number, costoKilometroViaje: number, fn: any) => {
    this.mongo.connect();
    let cant = 0;
    try {
      await this.mongo.model.aggregate([
        {
          $group:
          {
            '_id': null,
            'nid': { $max: '$id' },
          }
        }
      ]).then((response: any, error: any) => {
        cant = response[0].nid + 1;
      });

    } catch (err) {
      cant = 1;
      console.log(err);
    }
    await this.mongo.model.create({ 'id': cant,'idViaje':idViaje, 'toneladaKilometro': toneladaKilometro, 'costoTonelada': costoTonelada, 'costocarga': costocarga, 'costoHoraadicional': costoHoraadicional, 'horasEspera': horasEspera, 'costoTiempoEspera': costoTiempoEspera, 'toneladaKilometroViaje': toneladaKilometroViaje, 'toneladaViaje': toneladaViaje, 'costoKilometro': costoKilometro, 'costoKilometroViaje': costoKilometroViaje })
      .then((response: any, error: any) => {
        //console.log(response);
        //console.log(error);
        fn(error);
      })
  }
  public obtenerFleteId = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ id: id });
    fn(rows);
  }
  public async idflete(): Promise<any> {
    this.mongo.connect();
    let cant = -1;
    this.mongo.model.aggregate([
      {
        $group:
        {
          '_id': null,
          'nid': { $max: '$id' },
        }
      }
    ]).then((response: any, error: any) => {
      cant = response[0].nid;
    });
    return cant;
  }
  public obtenerFleteIdViaje = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idViaje: id });
    fn(rows);
  }
}
export default fleteModel;