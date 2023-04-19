import mongo from '../database/mongo';

class costoFijoModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(2);
      
    }
  
}
export default costoFijoModel;