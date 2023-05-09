import mongo from '../database/mongo';
class rutaModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(9);
  }
  public obtenerRutas = async (idOrigen: number, idDestino: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ idCiudadOrigen: idOrigen, idCiudadDestino: idDestino });
    fn(rows);
  }
  public async getRutas (idOrigen:number, idDestino:number):Promise<any>{
    this.mongo.connect();
    const rows=await this.mongo.model.find({ idCiudadOrigen: idOrigen, idCiudadDestino: idDestino });
    return(rows[0]);
}
}
export default rutaModel;