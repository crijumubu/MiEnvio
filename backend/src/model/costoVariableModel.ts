import mongo from '../database/mongo';
class costoVariableModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(4);
  }
  public obtenerCostosVariables = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idConfiguracionVehiculo: id });
    fn(rows);
  }
}
export default costoVariableModel;