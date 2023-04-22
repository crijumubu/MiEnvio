import mongo from '../database/mongo';

class tipoVehiculoModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(13);
      
    }
    public obtenerVehiculos= async (fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find();
      fn(rows);
  }
  public idVehiculo= async (id:number, fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find({idTipoVehiculo:id});
      fn(rows);
  }
  
}
export default tipoVehiculoModel;