import mongo from '../database/mongo';

class tipoParametroCostoVariableModel {
    private mongo: mongo;

    constructor() {
      this.mongo = new mongo(11);
      
    }
  
}
export default tipoParametroCostoVariableModel;