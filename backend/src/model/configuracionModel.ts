import mongo from '../database/mongo';

class configuracionModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(2);
      
    }
  public obtenerConfiguraciones= async (fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find();
      fn(rows);
  }
  public idConfVehiculo= async (id:number, fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find({idVehiculoConfiguracion:id});
      fn(rows);
  }
  
}
export default configuracionModel;