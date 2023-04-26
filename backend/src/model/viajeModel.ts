import mongo from '../database/mongo';
class viajeModel {
    private mongo: mongo;
    constructor() {
      this.mongo = new mongo(16);
    }
    public registroViaje= async (fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find();
        //console.log(rows);
        fn(rows);
    }
    public obtenerViajeIdUser= async (id:number, fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find({idCiudad:id});
        fn(rows);
    }
}
export default viajeModel;