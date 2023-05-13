import mongo from '../database/mongo';
class tipoCargaModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(10);
  }
  public obtenerCargas = async (fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find();
    fn(rows);
  }
  public idCarga = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idTipoCarga: id });
    fn(rows);
  }
}
export default tipoCargaModel;