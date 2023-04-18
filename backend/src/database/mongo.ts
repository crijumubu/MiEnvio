import mongoose from 'mongoose';
import userSchema from './schema/userSchema';

class mongo{

  private uri: string;
  public model: any;
  public schemasList: any[] =[userSchema];

  constructor(indexSchema:number){
    
    
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