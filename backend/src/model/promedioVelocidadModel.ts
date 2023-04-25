import mongo from '../database/mongo';
class promedioVelocidadModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(7);
  }
  public obtenerVelocidades = async (fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find();
    fn(rows);
  }
  public idVelocidad = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idVelocidad: id });
    fn(rows);
  }
}
export default promedioVelocidadModel;