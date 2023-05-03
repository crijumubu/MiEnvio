import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/auth_controller.dart';

class User extends StatefulWidget {
  User({super.key, required this.hasAppbar, required this.name, required this.email, required this.password});
  final bool hasAppbar;
  final String name;
  final String email;
  final String password;

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConf = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  
  final AuthController _authController = AuthController();
  
  bool editable = false;

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

  @override
  Widget build(BuildContext context) {
    
    // _username.;

    return (widget.hasAppbar) ?  Scaffold(
      appBar: headerBack(context),
      body: Padding(
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
                  Field(placeholder: "Usuario:", initialValue: widget.name, controller: _username, editable: !editable, placeholder2: 'Nuevo usuario:', inputType: 'text',),
                  const SizedBox(height: 10,),
                  Field(placeholder: "Email:", initialValue: widget.email, controller: _email, editable: !editable, placeholder2: 'Nuevo email:', inputType: 'text',),
                  const SizedBox(height: 10,),
                  Field(placeholder: "Contraseña:", initialValue: widget.email, controller: _password, hiden: true, editable: !editable, placeholder2: 'Nueva contraseña:', inputType: 'password',),
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
                          
                        }else{
                          setState(() {
                              editable = !editable;
                          });
                        }
                        

                        if(_key.currentState!.validate()){
                          _key.currentState!.save();

                          _authController.allShippings(1);
                          return(false);
                        }
                      }),
                      Visibility(visible: editable, child: const SizedBox(width: 10,)),
                      Visibility(
                        visible: editable,
                        child: button(text: "Cancelar", callback: (){
                          setState(() {
                              editable = false;
                          });
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
                            }
                            final String email = (_email.text.isNotEmpty) ? _email.text : widget.email;
                            final String username = (_username.text.isNotEmpty) ? _username.text : widget.name;
                            final String password = (_password.text.isNotEmpty) ? _password.text : widget.password;

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