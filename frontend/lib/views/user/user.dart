import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/auth_controller.dart';

class User extends StatefulWidget {
  User({super.key, required this.hasAppbar, required this.name, required this.email, required this.password, required this.id, required this.updateUser, required this.userType});
  final bool hasAppbar;
  final String name;
  final String email;
  final String password;
  final int id;
  final int userType;
  final Function updateUser;

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConf = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;

  
  final AuthController _authController = AuthController();
  
  bool editable = false;
  bool locationActive = false;

  ElevatedButton button({required String text, required Function callback, String? text2}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // side: BorderSide(),
        backgroundColor: (text2 == null) ? Colors.red[600] : Color(0xff344E41),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
      ),
      onPressed: (){
        callback();
      }, 
      child: Text((editable)? text:(text2 ?? text), style: GoogleFonts.rubik(fontSize: 20),)
    );
  }

  void _getLocation() async {
    try {
      print("try");
      final LocationData locationResult = await location.getLocation();
      print(locationResult.latitude);
      
      await FirebaseFirestore.instance.collection('location').doc('conductor${widget.id}').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
        'name': '${widget.name}'
      }, SetOptions(merge: true));

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("location", true);
    } catch (e) {
      print(e);
    }
  }

  Future<bool?> checkLocationStatus()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool("location");
  }

  void _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('conductor${widget.id}').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': '${widget.name}'
      }, SetOptions(merge: true));
    });
  }

  void _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  @override
  void initState() {
    checkLocationStatus().then((value){
      if(value != null){
        setState(() {
          locationActive = value;
        });
      }
    });
    if(widget.userType == 2){
      _requestPermission();

    }
    location.changeSettings(interval: 300, accuracy: LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    // _username.;

    return (widget.hasAppbar) ?  Scaffold(
      appBar: headerBack(context),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [

                const SizedBox(height: 30,),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 233, 233, 233),
                  radius: 80,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color.fromARGB(255, 209, 209, 209),
                    backgroundImage: AssetImage("assets/images/profile.png",)
                  )
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: Text("Datos almacenados:", style: GoogleFonts.rubik(fontSize: 26, fontWeight: FontWeight.w600),)
                ),
                const SizedBox(height: 15,),
                Visibility(
                  visible: editable,
                  child: Column(
                    children: [
                      SizedBox(
                        // width: double.infinity,
                        child: Text("*Solo ingrese los campos que desee actualizar*", style: GoogleFonts.rubik(fontSize: 16, color: Colors.red[400]),),
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      Field(placeholder: "Usuario/Nombre:", initialValue: widget.name, controller: _username, editable: !editable, placeholder2: 'Nuevo usuario/nombre:', inputType: 'text',),
                      const SizedBox(height: 10,),
                      Field(placeholder: "Email:", initialValue: widget.email, controller: _email, editable: !editable, placeholder2: 'Nuevo email:', inputType: 'email',),
                      const SizedBox(height: 10,),
                      Field(placeholder: "Contraseña:", initialValue: "•••••••••••", controller: _password, hiden: true, editable: !editable, placeholder2: 'Nueva contraseña:', inputType: 'password',),
                      Visibility(
                        visible: editable,
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            Field(placeholder: "Confirmar nueva contraseña:", controller: _passwordConf, editable: !editable, placeholder2: 'Confirmar nueva contraseña:', inputType: 'passwordChecker',checkPasswords: _password,),
                          ],
                        )
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          button(text: "Guardar datos", text2: "Actualizar datos", callback: (){
                            if(editable){
                              if(_key.currentState!.validate()){
                                _key.currentState!.save();
                                if(_email.text.isEmpty && _username.text.isEmpty && _password.text.isEmpty){
                                  setState(() {
                                    editable = false;
                                  });
                                  return;
                                }
                                final String email = (_email.text.isNotEmpty) ? _email.text : widget.email;
                                final String username = (_username.text.isNotEmpty) ? _username.text : widget.name;
                                final String password = (_password.text.isNotEmpty) ? _password.text : widget.password;

                                _authController.updateUser(context, email, username, password, widget.id).then(
                                  (value){
                                    widget.updateUser();
                                  });

                                setState(() {
                                  editable = !editable;
                                });

                              }
                            }else{
                              setState(() {
                                  editable = !editable;
                              });
                            }
                            
                          }),
                          Visibility(visible: editable, child: const SizedBox(width: 10,)),
                          Visibility(
                            visible: editable,
                            child: button(text: "Cancelar", callback: (){
                              setState(() {
                                  editable = false;
                              });
                              _key.currentState!.reset();
                              _email.clear();
                              _password.clear();
                              _passwordConf.clear();
                              _username.clear();
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),  
                const SizedBox(height: 10,),
                const Divider(color: Colors.black54,),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Ubicación: ", 
                          style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
                        ),
                        (locationActive) ? 
                        TextSpan(text: "Activa",
                        style: GoogleFonts.rubik(color: Colors.green)
                        ) :
                        TextSpan(
                          text: "Inactiva",
                        style: GoogleFonts.rubik(color: Colors.red)
                        )
                      ],
                      style: GoogleFonts.rubik(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w400),
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // side: BorderSide(),
                    backgroundColor: (locationActive) ? Colors.red[600] : Color(0xff344E41),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
                  onPressed: ()async{
                    final bool? hasCollection = await checkLocationStatus();
                    final SharedPreferences prefs = await SharedPreferences.getInstance();

                    if(hasCollection == null){
                      setState(() {
                        locationActive = false;
                      });
                      _getLocation();
                      _listenLocation();
                    }else if(locationActive){
                      setState(() {
                        locationActive = false;
                      });
                      _stopListening();
                      prefs.setBool("location", false);
                    }else{
                      _listenLocation();
                      setState(() {
                        locationActive = true;
                      });
                    }
                  }, 
                  child: Text((locationActive)? "Desactivar ubicación":"Activar ubicación", style: GoogleFonts.rubik(fontSize: 20),)
                ),

                const SizedBox(height: 40,),
              ],
            ),
          ),
        ],
      ),
    ):
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Icon(Icons.user)
            // Text("Usuario", style: GoogleFonts.rubik(fontSize: 32),)
            const SizedBox(height: 30,),
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 233, 233, 233),
              radius: 80,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Color.fromARGB(255, 209, 209, 209),
                backgroundImage: AssetImage("assets/images/profile.png",)
              )
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: Text("Datos almacenados:", style: GoogleFonts.rubik(fontSize: 26, fontWeight: FontWeight.w600),)
            ),
            const SizedBox(height: 15,),
            Visibility(
              visible: editable,
              child: Column(
                children: [
                  SizedBox(
                    // width: double.infinity,
                    child: Text("*Solo ingrese los campos que desee actualizar*", style: GoogleFonts.rubik(fontSize: 16, color: Colors.red[400]),),
                  ),
                  const SizedBox(height: 15,),
                ],
              ),
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  Field(placeholder: "Usuario/Nombre:", initialValue: widget.name, controller: _username, editable: !editable, placeholder2: 'Nuevo usuario/nombre:', inputType: 'text',),
                  const SizedBox(height: 10,),
                  Field(placeholder: "Email:", initialValue: widget.email, controller: _email, editable: !editable, placeholder2: 'Nuevo email:', inputType: 'email',),
                  const SizedBox(height: 10,),
                  Field(placeholder: "Contraseña:", initialValue: "•••••••••••", controller: _password, hiden: true, editable: !editable, placeholder2: 'Nueva contraseña:', inputType: 'password',),
                  Visibility(
                    visible: editable,
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Field(placeholder: "Confirmar nueva contraseña:", controller: _passwordConf, editable: !editable, placeholder2: 'Confirmar nueva contraseña:', inputType: 'passwordChecker',checkPasswords: _password,),
                      ],
                    )
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(text: "Guardar datos", text2: "Actualizar datos", callback: (){
                        if(editable){
                          if(_key.currentState!.validate()){
                            _key.currentState!.save();
                            if(_email.text.isEmpty && _username.text.isEmpty && _password.text.isEmpty){
                              setState(() {
                                editable = false;
                              });
                              return;
                            }
                            final String email = (_email.text.isNotEmpty) ? _email.text : widget.email;
                            final String username = (_username.text.isNotEmpty) ? _username.text : widget.name;
                            final String password = (_password.text.isNotEmpty) ? _password.text : widget.password;

                            _authController.updateUser(context, email, username, password, widget.id).then(
                              (value){
                                widget.updateUser();
                              });

                            setState(() {
                              editable = !editable;
                            });
                            // _authController.allShippings(1);
                            // return(false);
                          }
                        }else{
                          setState(() {
                              editable = !editable;
                          });
                        }
                        // if(_email.te)
                        // _email.text = widget.email;
                        // _username.
                        
                      }),
                      Visibility(visible: editable, child: const SizedBox(width: 10,)),
                      Visibility(
                        visible: editable,
                        child: button(text: "Cancelar", callback: (){
                          setState(() {
                              editable = false;
                          });
                          _key.currentState!.reset();
                          _email.clear();
                          _password.clear();
                          _passwordConf.clear();
                          _username.clear();
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
            
            
            // Field(placeholder: "Usuario:", value: "usuario", controller: _username),
          ],
        ),
      );
  }
}

// ignore: must_be_immutable
class Field extends StatelessWidget {
  Field({super.key, required this.placeholder, this.initialValue, required this.controller, this.hiden, required this.editable, required this.placeholder2, required this.inputType, this.checkPasswords});
  final String placeholder;
  final String placeholder2;
  final String? initialValue;
  late  bool? hiden;
  final bool editable;
  final String inputType;
  final TextEditingController controller;
  final TextEditingController ?checkPasswords;


  @override
  Widget build(BuildContext context) {
    // controller.text = initialValue ?? "";
    if(hiden == null) hiden = false;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text((editable) ? placeholder : placeholder2, style: GoogleFonts.rubik(fontSize: 18),)
        ),
        SizedBox(height: 10,),
        TextFormField(
          obscureText: hiden ?? false,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            fillColor: Colors.pink,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: !editable ? Color.fromARGB(255, 68, 131, 67) : Color.fromARGB(255, 61, 54, 54))),
            // bor
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            // color
            
            hintText:  (!hiden! || editable) ? (initialValue ?? "") : ""
          ),
          style: TextStyle(fontSize: 15),
          
          readOnly: editable,
          scrollPadding: EdgeInsets.all(0),
          controller: controller,

          validator: (value){
          //   if(value==null || value.isEmpty){
          //   return "Campo obligatorio";

          // }\
          if(value != initialValue || value!.isEmpty){
            switch (inputType) {
              case 'text':
                
                if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value!) && value.isNotEmpty){
                  return "Por favor ingresar unicamente caracteres de texto.";
                }
                break;
              case 'number':
                if(!RegExp(r'^[0-9]+$').hasMatch(value!)){
                  return "Por favor ingresar unicamente caracteres numericos.";
                }
                break;
              case 'email':
                if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)  && value.isNotEmpty){
                  return "Por favor ingresar un correo valido.";
                }
                break;
              case 'passwordChecker':
                if(checkPasswords!=null && checkPasswords!.text != value){
                 return "Las contraseñas no coinciden";
                }
                break;
              default:
                return null;
            }
          }
          
          return null;
          },
        )
      ],
    );
  }
}