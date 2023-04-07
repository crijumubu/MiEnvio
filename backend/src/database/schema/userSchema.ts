import { Schema, model } from 'mongoose';
import IUsers from '../interface/IUser';

const usersSchema = new Schema({
  name:{
    type: String,
    required: true
    

  },
  email: {
    type: String,
    required: true,
    unique: true
  },
  password: {
    type: String,
    requied: true
  },
  userType:{
    type: Number,
    required: true
  }
}, 
{
  versionKey: false
});

export default model<IUsers>('users', usersSchema);