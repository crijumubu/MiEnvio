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
  public async velocidadVehiculo(id:number):Promise<any>{
    this.mongo.connect();
    const rows=await this.mongo.model.find({idVehiculoVelocidad:id});
    return(rows[0]);
}
  
}
export default promedioVelocidadModel;