import mongo from '../database/mongo';

class configuracionModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(2);
      
    }
  
}
export default configuracionModel;