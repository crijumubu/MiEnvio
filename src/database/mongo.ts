import mongoose from "mongoose";
import userSchema from "./schema/userSchema";

class mongo{

    private uri: string;
    public model: any;

    constructor(){

        this.uri = `${process.env.MONGODB}`;
        this.model = userSchema;
    }

    public connect = () => {

        mongoose.set('strictQuery', true);
        mongoose.connect(this.uri)
        .then(() => {

            console.log("Connected to MongoDB Atlas");
        })
        .catch(error => {

            console.error('Error connecting to MongoDB Atlas: ', error);
            return process.exit(1);
        });
    }
}

export default mongo;