import mongo from '../database/mongo';

class rutaPeajeModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(8);
      
    }
  
}
export default rutaPeajeModel;