import mongo from '../database/mongo';

class ciudadModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(1);
      
    }
    public obtenerCiudades= async (fn:Function)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find();
        fn(rows);
    }
    public idCiudad= async (id:number, fn:Function)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find({idCiudad:id});
        fn(rows);
    }
  
}
export default ciudadModel;