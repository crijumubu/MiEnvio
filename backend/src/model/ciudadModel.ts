import mongo from '../database/mongo';

class ciudadModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(1);
      
    }
  
}
export default ciudadModel;