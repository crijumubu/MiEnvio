import mongo from '../database/mongo';
import bcrypt from 'bcryptjs';

class usersModel {

  private mongo: mongo;

  constructor() {

    this.mongo = new mongo(0);
  }

  public login = async (email: string, password: string, fn: (status: number, type: number) => void) => {

    this.mongo.connect();

    await this.mongo.model.find({ 'email': email })
      .then((response: any, error: any) => {

        if (error) {

          fn(-1, -1);
          return;
        }

        if (response.length == 1) {
          //console.log(response[0]['password']);

          if (bcrypt.compareSync(password, response[0]['password'])) {

            fn(1, response[0]['userType']);
            return;
          }
        }

        fn(0, 0);
      })
  }

  public register = async (name: string, email: string, password: string, userType: Int16Array, fn: (status: any) => void) => {

    this.mongo.connect();

    await this.mongo.model.create({ 'name': name, 'email': email, 'password': this.cryptPassword(password), 'userType': userType })
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