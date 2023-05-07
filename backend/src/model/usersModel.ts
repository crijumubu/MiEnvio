import mongo from '../database/mongo';
import bcrypt from 'bcryptjs';

class usersModel{

  private mongo: mongo;

  constructor(){
        
    this.mongo = new mongo();
  }

  public login = async (email: string, password: string, fn: (status: number) => void) => {
        
    this.mongo.connect();
        
    await this.mongo.model.find({'email': email}, {'password': 1, '_id': 0})
      .then((response: any, error: any) => {
            
        if (error){

          fn(-1);
          return;
        }

        if(response.length == 1){
                
          if (bcrypt.compareSync(password, response[0]['password'])){
                    
            fn(1);
            return;
          }
        }

        fn(0);
      })
  }

  public register = async (email: string, password: string, fn:(status: any) => void) => {
        
    this.mongo.connect();

    await this.mongo.model.create({'email': email, 'password': this.cryptPassword(password)})
      .then((response: any, error: any) => {
            
        fn(error);
      })
  }

  public cryptPassword = (password: string) => {

    const salt = bcrypt.genSaltSync(10);
    const hashedPassword = bcrypt.hashSync(password, salt);

    return hashedPassword;
  }
}

export default usersModel;