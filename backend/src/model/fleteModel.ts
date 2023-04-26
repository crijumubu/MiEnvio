import mongo from '../database/mongo';
class fleteModel {
    private mongo: mongo;
    constructor() {
      this.mongo = new mongo(14);
    }
    public registroFlete= async ( fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find();
        //console.log(rows);
        fn(rows);
    }
    public obtenerFleteId= async (id:number, fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find({idCiudad:id});
        fn(rows);
    }
}
export default fleteModel;