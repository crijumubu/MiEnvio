import mongo from '../database/mongo';
class promedioConsumoModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(6);
  }
  public obtenerConsumos = async (fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find();
    fn(rows);
  }
  public idConsumo = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idConsumo: id });
    fn(rows);
  }
}
export default promedioConsumoModel;