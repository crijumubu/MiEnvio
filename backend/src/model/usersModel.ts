import mongo from '../database/mongo';
import bcrypt from 'bcryptjs';
class usersModel {
  private mongo: mongo;
  constructor() {
    this.mongo = new mongo(0);
  }
  public login = async (email: string, password: string, fn: (status: number, type: number, id:number) => void) => {
    this.mongo.connect();
    await this.mongo.model.find({ 'email': email })
      .then((response: any, error: any) => {
        if (error) {
          fn(-1, -1,-1);
          return;
        }
        if (response.length == 1) {
          //console.log(response[0]['password']);
          if (bcrypt.compareSync(password, response[0]['password'])) {
            fn(1, response[0]['userType'],response[0]['id']);
            return;
          }
        }
        fn(0, 0,0);
      })
  }
  public register = async (name: string, email: string, password: string, userType: Int16Array, fn: (status: any) => void) => {
    this.mongo.connect();
    let cant = -1;
    try {
      await this.mongo.model.aggregate([
        {
          $group:
          {
            '_id': null,
            'nid': { $max: '$id' },
          }
        }
      ]).then((response: any, error: any) => {
        cant = response[0].nid + 1;
      });
    } catch (err) {
      console.log(err);
      cant = 1;
    }
    await this.mongo.model.create({ 'id': cant, 'name': name, 'email': email, 'password': this.cryptPassword(password), 'userType': userType })
      .then((response: any, error: any) => {
        //console.log(response);
        //console.log(error);
        fn(error);
      })
  }
  public cryptPassword = (password: string) => {
    const salt = bcrypt.genSaltSync(10);
    const hashedPassword = bcrypt.hashSync(password, salt);
    return hashedPassword;
  }
  public getNombre = async (id: number, fn: any) => {
    this.mongo.connect();
    const rows = await this.mongo.model.find({ 'id': id });
    fn(rows);
  }
}
export default usersModel;