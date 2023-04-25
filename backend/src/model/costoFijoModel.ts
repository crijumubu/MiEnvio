import mongo from '../database/mongo';
class costoFijoModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(3);
  }
  public obtenerCostosFijos = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idConfiguracionVehiculo: id });
    fn(rows);
  }
}
export default costoFijoModel;