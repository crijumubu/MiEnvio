import mongo from '../database/mongo';

class tipoCargaModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(10);
      
    }
  
}
export default tipoCargaModel;