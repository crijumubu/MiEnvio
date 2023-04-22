import mongo from '../database/mongo';

class tipoUnidadModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(12);
      
    }
    public obtenerUnidades= async (fn:Function)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find();
      fn(rows);
  }
  public idUnidad= async (id:number, fn:Function)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find({idTipoUnidad:id});
      fn(rows);
  }
  
}
export default tipoUnidadModel;