import mongo from '../database/mongo';
class rutaPeajeModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(8);
  }
  public obtenerRutaPeaje = async (idTuta: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idRuta: idTuta });
    fn(rows);
  }
  public getRutaPeaje = async (idTuta: number) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idRuta: idTuta });
    return rows;
  }
}
export default rutaPeajeModel;