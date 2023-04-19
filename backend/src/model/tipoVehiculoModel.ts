import mongo from '../database/mongo';

class tipoVehiculoModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(13);
      
    }
  
}
export default tipoVehiculoModel;