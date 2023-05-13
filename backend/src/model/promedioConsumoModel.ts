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
  public getConsumos = async (id: number) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idVehiculoConsumo: id });
    return rows[0];
  }
  
}
export default promedioConsumoModel;