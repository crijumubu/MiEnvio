import mongoose from 'mongoose';
import userSchema from './schema/userSchema';
import ciudadSchema from './schema/ciudadSchema';
import configuracionSchema from './schema/configuracionSchema';
import costoFijoSchema from './schema/costoFijoSchema';
import costoVariableSchema from './schema/costoVariableSchema';
import peajeSchema from './schema/peajeSchema';
import promedioConsumoSchema from './schema/promedioConsumoSchema';
import promedioVelocidadSchema from './schema/promedioVelocidadSchema';
import rutaPeajeSchema from './schema/rutaPeajeSchema';
import rutaSchema from './schema/rutaSchema';
import tipoCargaSchema from './schema/tipoCargaSchema';
import tipoParametroCostoVariableSchema from './schema/tipoParametroCostoVariableSchema';
import tipoUnidadSchema from './schema/tipoUnidadSchema';
import tipoVehiculoSchema from './schema/tipoVehiculoSchema';
class mongo {

  private uri: string;
  public model: any;
  public schemasList: any[] = [userSchema, ciudadSchema, configuracionSchema, costoFijoSchema, costoVariableSchema, peajeSchema, promedioConsumoSchema, promedioVelocidadSchema, rutaPeajeSchema, rutaSchema, tipoCargaSchema, tipoParametroCostoVariableSchema, tipoUnidadSchema, tipoVehiculoSchema];

  constructor(indexSchema: number) {

    this.uri = `${process.env.MONGODB}`;
    this.model = this.schemasList[indexSchema];
  }

  public connect = () => {

    mongoose.set('strictQuery', true);
    mongoose.connect(this.uri)
      .then(() => {

        console.log('Connected to MongoDB Atlas');
      })
      .catch(error => {

        console.error('Error connecting to MongoDB Atlas: ', error);
        return process.exit(1);
      });
  }
}

export default mongo;