import mongo from '../database/mongo';

class tipoUnidadModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(12);
      
    }
  
}
export default tipoUnidadModel;