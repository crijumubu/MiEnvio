import mongo from '../database/mongo';

class costoFijoModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(3);
      
    }
  
}
export default costoFijoModel;