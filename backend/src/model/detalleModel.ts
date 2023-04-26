import mongo from '../database/mongo';
class detalleModel {
    private mongo: mongo;
    constructor() {
      this.mongo = new mongo(15);
    }
    public registroDetalles= async (fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find();
        //console.log(rows);
        fn(rows);
    }
    public obtenerDetallesIdFlete= async (id:number, fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find({idCiudad:id});
        fn(rows);
    }
}
export default detalleModel;