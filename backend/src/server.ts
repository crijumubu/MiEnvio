import express, {Application, json, urlencoded} from "express";
import dotenv from "dotenv";
import cors from "cors";

import usersRoute from "./routes/usersRoute";

class Server {

    private backend: Application;
    private userRouter: usersRoute;

    constructor(){
        
        dotenv.config();
        this.backend = express();
        this.userRouter = new usersRoute();
        this.config();
        this.route();
        this.start();
    }

    public config = () => {

        this.backend.set("port", process.env.PORT);
        this.backend.use(urlencoded({extended: true}));
        this.backend.use(json());
        this.backend.use(cors());
    }

    public route = () => {

        this.backend.use(`${process.env.USERSROUTE}`, this.userRouter.router);
    }

    public start = () => {
        
        this.backend.listen(process.env.PORT, () => {

            console.log("Server on port:", process.env.PORT);
        });
    }
}

const server = new Server();