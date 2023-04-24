import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../views/introduction/widgets/alerts.dart';

class AuthController{
  final _url = "http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api"; 
  late SharedPreferences shPref;

  Future register(dynamic context, String user, String pass, String email, int userType) async{
    var response = await http.post(Uri.parse("$_url/register"), body:{
      "name": user,
      "email": email,
      "password": pass,
      "userType": "$userType"
    });

    log(response.body);
    if(response.statusCode == 200){
      succesfulAlert(context, "Registro Exitoso");
      Future.delayed(const Duration(seconds: 2, milliseconds: 500),(){
        Navigator.pushNamed(context, "/initial-page").then((value) => null);
      });
      
    }else if(response.statusCode == 409){
      errorAlert(context, 2, "El usuario ya se encuentra en uso!");
    }
  }

  Future login(dynamic context, String email, String pass, ) async{
    shPref = await SharedPreferences.getInstance();
    
    var response = await http.post(Uri.parse("$_url/login"), body:{
      "email": email,
      "password": pass,
    });
    log("${response.body}");
    if(response.statusCode == 200){
      var loginArr = json.decode(response.body);
      shPref.setString("token", loginArr["data"]["token"]);
      shPref.setString("usename", loginArr["data"]["token"]);
      // log("$loginArr");
      // log("${loginArr['userType'].runtimeType}");
      // log("${loginArr['userType']=='2'}");
      if(loginArr["data"]["userType"]==1) Navigator.pushNamed(context, "/home-supervisor");
      if(loginArr["data"]["userType"]==2) Navigator.pushNamed(context, "/home");
      
    }else{
      errorAlert(context, 2, "Credenciales incorrectas");
      // print("Wrong Credentials");
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