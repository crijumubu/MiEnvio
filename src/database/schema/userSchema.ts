import { Schema, model } from "mongoose";
import IUsers from "../interface/IUser";

const usersSchema = new Schema({
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        requied: true
    }
}, 
{
    versionKey: false
});

export default model<IUsers>('users', usersSchema);