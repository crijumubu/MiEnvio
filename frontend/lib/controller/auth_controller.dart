import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController{
  final _url = "http://192.168.1.5:1000/users"; // "http://10.152.164.137:1000/users"
  late SharedPreferences shPref;

  Future login(String email, String pass, dynamic context) async{
    shPref = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse("$_url/login"), body:{
      "email": email,
      "password": pass,
    });

    if(response.statusCode == 200){
      var loginArr = json.decode(response.body);
      shPref.setString("token", loginArr["data"]["token"]);
      
      print(shPref.getString("token"));
    }else{
      print("Wrong Credentials");
    }

  }

  Future isLogged() async{
    shPref = await SharedPreferences.getInstance();
    String?  token = shPref.getString("token");
    var response = await http.post(Uri.parse("$_url/session"), body:{
      "token" : token,
    });

    if(response.statusCode == 200){
      return Future.value(true);
    }

    return Future.value(false);
  }

  Future closeSession() async{
    shPref = await SharedPreferences.getInstance();
    await shPref.remove("token");

  }


}