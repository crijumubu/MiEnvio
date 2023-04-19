import mongo from '../database/mongo';

class rutaModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(9);
      
    }
  
}
export default rutaModel;