import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/register_shipping/register_shipping.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
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

    if(response.statusCode == 200){
      succesfulAlert(context, "Registro Exitoso");
      Future.delayed(const Duration(seconds: 2, milliseconds: 500),(){
        Navigator.pushNamed(context, "/initial-page");
      });
      
    }else if(response.statusCode == 409){
      errorAlert(context, "El usuario ya se encuentra en uso!");
    }
  }

  Future login(dynamic context, String email, String pass, ) async{
    shPref = await SharedPreferences.getInstance();
    
    var response = await http.post(Uri.parse("$_url/login"), body:{
      "email": email,
      "password": pass,
    });

    if(response.statusCode == 200){
      var loginArr = json.decode(response.body);
      // shPref.setString("token", loginArr["data"]["token"]);
      // shPref.setString("usename", loginArr["data"]["token"]);
      var userData = jsonDecode(response.body);
      
      if(userData["data"]["userType"]==1) Navigator.pushNamed(context, "/home-supervisor", arguments: loginArr["data"]["idUser"]);
      if(userData["data"]["userType"]==2) Navigator.pushNamed(context, "/home", arguments: loginArr["data"]["idUser"]);

      // getUserData(context, loginArr["data"]["idUser"]);
      
    }else{
      errorAlert(context, "Credenciales incorrectas");
    }

  }

  // Future isLogged() async{
  //   shPref = await SharedPreferences.getInstance();
  //   String?  token = shPref.getString("token");
  //   var response = await http.post(Uri.parse("$_url/session"), body:{
  //     "token" : token,
  //   });

  //   if(response.statusCode == 200){
  //     return Future.value(true);
  //   }

  //   return Future.value(false);
  // }
  

  Future closeSession() async{
    shPref = await SharedPreferences.getInstance();
    await shPref.remove("token");
  }

  
  Future<Usuario?> getUserData( int id) async{
    var response = await http.get(Uri.parse("$_url/getDataUser/$id"));

    if(response.statusCode == 200){
      var userData = jsonDecode(response.body);
      Usuario user = Usuario(userData[0]["id"], userData[0]["name"], userData[0]["email"], userData[0]["password"], userData[0]["userType"]);
      return user;
     
    }
    return null;
  }

  Future activeShippings(int id)async{
    var response = await http.get(Uri.parse("$_url/viajeIdUsrActivo/$id"));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
  }

  Future allShippings(int id)async{
    var response = await http.get(Uri.parse("$_url/viajeIdUsr/$id"));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
  }

  static Future<String?> fetchUrl(Uri uri, {Map<String,String>? headers})async{
    try {
      final response = await http.get(uri, headers: headers);
      if(response.statusCode == 200){
        return response.body;
      } 
  
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<String?> addressToLatLn(Uri uri)async{
    try {
      final response = await http.get(uri);
      if(response.statusCode == 200){
        return response.body;
      } 
  
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future setDriver(context, int idViaje, int idConductor)async{
    final body = '{"idViaje": ${idViaje},"idConductor":${idConductor}}';
    final headers = {"Content-type":'application/json'};

    var response = await http.post(Uri.parse("$_url/asignar"), headers: headers,body:body);
    
    if(response.statusCode == 200){
      return updateStatus(context: context, estado: 2, idViaje: idViaje).then((value) { 
        log(value.toString());
        return value;
      });
    }
    errorAlert(context,"Error al actualizar el estado.");

    return false;
  }

  
  Future updateStatus({BuildContext? context, required int idViaje, required int estado})async{
    final headers = {"Content-type":'application/json'};

    var response = await http.post(Uri.parse("$_url/cambioEstados"), headers: headers, body:jsonEncode({
      "idViaje": idViaje,
      "estado": estado
    }));

    if(response.statusCode == 200){
      if(context != null){
        succesfulAlert(context, "Conductor Asignado Exitosamente");
        return true;
      }
    }
    return false;
  }

  Future registerShipping(context, NewShipping envio, int userId)async{
    Uri urlT = Uri.parse("http://mienvio.bucaramanga.upb.edu.co:1802/mienvio/api/registroViaje");
    final headers = {"Content-type":'application/json'};
    final body = '{"idUsuario":${envio.idUsuario}, "nombre":"${envio.nombre}","origen":"${envio.origen}","destino":"${envio.destino}","estado":${1},"direccion":"${envio.direccion}" }';
    
    var response = await http.post(urlT, headers: headers, body: body);

    if(response.statusCode == 200){
      succesfulAlert(context, "Envío registrado.");
      Future.delayed(const Duration(seconds: 1, milliseconds: 600),(){
        // ! Calcular flete
        // ! Pasar flete calculado a la ruta
        var data = jsonDecode(response.body);

        getShippingId(data["idViaje"]).then((e){
          if(e != null){
            final Shipping envioN = Shipping(nombre: e[0]["nombre"], idViaje: e[0]["idViaje"], idUsuario: e[0]["idUsuario"], origen: e[0]["origen"], destino: e[0]["destino"],  estado: e[0]["estado"], idConductor: e[0]["idConductor"], direccion: e[0]["direccion"]);
            Navigator.pushReplacementNamed(context, "/flete", arguments: [envioN,userId]);
          }

        });

      
        // Navigator.pushNamed(context, "/flete");
      }); 

    }
  }

  Future registerFlete(NewShipping envio, int idViaje)async{
    Uri urlT = Uri.parse("$_url/registroFlete");
    final headers = {"Content-type":'application/json'};
    final body = '{"idViaje":$idViaje,"toneladaKilometro":${envio.toneladaKilometro}, "costoTonelada":${envio.costoTonelada}, "costocarga":${envio.costocarga}, "costoHoraadicional":${envio.costoHoraadicional}, "horasEspera":${envio.horasEspera}, "costoTiempoEspera":${envio.costoTiempoEspera}, "toneladaKilometroViaje":${envio.toneladaKilometroViaje}, "toneladaViaje":${envio.toneladaViaje}, "costoKilometro":${envio.costoKilometro}, "costoKilometroViaje":${envio.costoKilometroViaje}}';
    
    var response = await http.post(urlT,headers: headers,body: body);
    if(response.statusCode == 200){
      // print("");
      // Future.delayed(const Duration(seconds: 2, milliseconds: 500),(){
      // });
    }
  }

  Future updateUser(context, String email, String username, String password, int id)async{
    final headers = {"Content-type":'application/json'};

    var response = await http.post(Uri.parse("$_url/updateUser"),headers: headers, body: '{"id":$id, "name":"$username", "email":"$email", "password":"$password"}');

    if(response.statusCode == 200){
      succesfulAlert(context, "Datos actualizados.");
    }
  }

  Future getShippingsDriver(int idConductor)async{
    
    var response = await http.get(Uri.parse("$_url/viajeIdConductor/$idConductor"));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }

  }

  Future getFlete(int idViaje)async{
    var response = await http.get(Uri.parse("$_url/fleteId/$idViaje"));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
  }

  Future getShippingId(int idViaje)async{
    var response = await http.get(Uri.parse("$_url/viajeId/$idViaje"));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
  }
}