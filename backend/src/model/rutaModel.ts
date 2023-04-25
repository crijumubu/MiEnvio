import mongo from '../database/mongo';
class rutaModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(9);
  }
  public obtenerRutas = async (idOrigen: number, idDestino: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idCiudadOrigen: idOrigen, idCiudadDestino: idDestino });
    fn(rows);
  }
}
export default rutaModel;