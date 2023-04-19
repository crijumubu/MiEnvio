import mongo from '../database/mongo';

class costoVariableModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(4);
      
    }
  
}
export default costoVariableModel;