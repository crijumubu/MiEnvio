import mongo from '../database/mongo';

class promedioConsumoModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(6);
      
    }
  
}
export default promedioConsumoModel;