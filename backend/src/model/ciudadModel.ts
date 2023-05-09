import mongo from '../database/mongo';
class ciudadModel {
    private mongo: mongo;
    constructor() {
      this.mongo = new mongo(1);
    }
    public obtenerCiudades= async (fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find();
        //console.log(rows);
        fn(rows);
    }
    public idCiudad= async (id:number, fn:any)=>{
        this.mongo.connect();
        const rows=await this.mongo.model.find({idCiudad:id});
        fn(rows);
    }
    public async ciudadNombre(nombre:string):Promise<any>{
        this.mongo.connect();
        const rows=await this.mongo.model.find({nombreCiudad:nombre});
        return(rows[0].idCiudad);
    }
}
export default ciudadModel;