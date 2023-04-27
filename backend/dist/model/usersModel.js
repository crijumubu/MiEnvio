"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongo_1 = __importDefault(require("../database/mongo"));
const bcryptjs_1 = __importDefault(require("bcryptjs"));
class usersModel {
    constructor() {
        this.login = (email, password, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            yield this.mongo.model.find({ 'email': email })
                .then((response, error) => {
                if (error) {
                    fn(-1, -1);
                    return;
                }
                if (response.length == 1) {
                    //console.log(response[0]['password']);
                    if (bcryptjs_1.default.compareSync(password, response[0]['password'])) {
                        fn(1, response[0]['userType']);
                        return;
                    }
                }
                fn(0, 0);
            });
        });
        this.register = (name, email, password, userType, fn) => __awaiter(this, void 0, void 0, function* () {
            this.mongo.connect();
            let cant = -1;
            try {
                yield this.mongo.model.aggregate([
                    {
                        $group: {
                            '_id': null,
                            'nid': { $max: '$id' },
                        }
                    }
                ]).then((response, error) => {
                    cant = response[0].nid + 1;
                });
            }
            catch (err) {
                console.log(err);
                cant = 1;
            }
            yield this.mongo.model.create({ 'id': cant, 'name': name, 'email': email, 'password': this.cryptPassword(password), 'userType': userType })
                .then((response, error) => {
                //console.log(response);
                //console.log(error);
                fn(error);
            });
        });
        this.cryptPassword = (password) => {
            const salt = bcryptjs_1.default.genSaltSync(10);
            const hashedPassword = bcryptjs_1.default.hashSync(password, salt);
            return hashedPassword;
        };
        this.mongo = new mongo_1.default(0);
    }
}
exports.default = usersModel;
