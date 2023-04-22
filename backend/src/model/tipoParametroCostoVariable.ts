import mongo from '../database/mongo';

class tipoParametroCostoVariableModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(11);
      
    }
    public obtenerParametros= async (fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find();
      fn(rows);
  }
  public idParametros= async (id:number, fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find({idParametro:id});
      fn(rows);
  }
}
export default tipoParametroCostoVariableModel;