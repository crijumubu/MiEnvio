import mongo from '../database/mongo';

class promedioVelocidadModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(7);
      
    }
  
}
export default promedioVelocidadModel;