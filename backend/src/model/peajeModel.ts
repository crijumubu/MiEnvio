import mongo from '../database/mongo';

class peajeModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(5);
      
    }
    public optenerPeaje= async (id:number, fn:any)=>{
      this.mongo.connect();
      const rows=await this.mongo.model.find({idPeaje:id});
      fn(rows);
  }
  
}
export default peajeModel;