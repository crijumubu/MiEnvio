import mongo from '../database/mongo';
class peajeModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(5);
  }
  public optenerPeaje = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idPeaje: id });
    fn(rows);
  }
  public getPeaje = async (id: number) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idPeaje: id });
    return rows[0];
  }
}
export default peajeModel;