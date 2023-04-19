import mongo from '../database/mongo';

class peajeModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(5);
      
    }
  
}
export default peajeModel;