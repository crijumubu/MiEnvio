import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/bottom.dart';
import 'widgets/header_back.dart';
import '../initial_page/widgets/routing_button.dart';
import 'widgets/text_input.dart';

enum UserType {conductor, supervisor}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> { 
  
  final AuthController _authController = AuthController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? _typeUser;
  bool _showWarning = false;

  final ScrollController _scrollController = ScrollController();


  RadioListTile userType({required String userTitle, required userType }){
    return RadioListTile(
      activeColor: const Color(0xff344E41),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(userTitle, style: GoogleFonts.rubik(fontSize: (userType == _typeUser ? 22:18), color: const Color(0xff344E41), fontWeight: (userType != _typeUser ? FontWeight.normal: FontWeight.bold) )),
      value: userType,
      groupValue: _typeUser,
      onChanged: (value){
        // _userType.text = "\n";
        setState(() {
          _typeUser = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBack(context),
      bottomSheet: Container(
        // color: Colors.grey, 
        height: 0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
              BoxShadow(color: Color.fromARGB(255, 36, 36, 36), blurRadius: 30.0, offset: Offset(0, -5), spreadRadius: 8 )
            ]
        ),
      ),
      // resizeToAvoidBottomInset: false,
      body: 
        ListView(
          controller: _scrollController,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
        
              children: [
        
                
                Column(
                  children: [
                    
                    const SizedBox(height: 35,),
                    Text("Registrarme", style: GoogleFonts.rubik(fontSize: 38, fontWeight: FontWeight.w700),),
        
                    const SizedBox(height: 35,),
                    
                    
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text("Tipo de usuario:", style: GoogleFonts.rubik(fontSize: 22, color: const Color(0xff3A5A40), fontWeight: FontWeight.w400),)
                          ),
                          // TextInput(fieldController: _userType, warningController: _typeUser, placeholder: "Tipo de usuario:", inputType: 'warning',),
                          const SizedBox(height: 10,),

                          
                        ],
                      ),
                    ),

                    userType(userTitle: "Conductor", userType: "conductor"),
                    userType(userTitle: "Supervisor", userType: "supervisor"), 
                    const SizedBox(height: 10,),
                    if(_showWarning)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Expanded(child: AnimatedContainer(duration: const Duration(seconds: 1), padding: const EdgeInsets.only(left:  10, right: 10, top: 10), decoration: const BoxDecoration(border: Border(top:   BorderSide(color: Color(0xFFC62828) ))),child: Text("Campo obligatorio", style: GoogleFonts.rubik(fontSize: 12,color: const Color (0xFFC62828)),))),
                        ],
                                          ),
                      ),
                    
                    if(_showWarning)
                      const SizedBox(height: 25,),

                    Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          
        
                          TextInput(fieldController: _userController, placeholder: "Usuario", inputType: 'text', maxLength: 18,),
                          const SizedBox(height: 20,),
                          TextInput(fieldController: _emailController, placeholder:  "Correo Electrónico",  inputType: 'email',),
                          const SizedBox(height: 20,),
                          TextInput(fieldController: _passwordController, placeholder:  "Contraseña", inputType: 'password', maxLength: 16,),
                          const SizedBox(height: 20,),
                          TextInput(fieldController: _passwordConfCont, placeholder:  "Confirmar Contraseña",  checkPasswords: _passwordController, inputType: 'passwordChecker', maxLength: 16,),
                          const SizedBox(height: 30,),
                          RoutingButton(text: "Registrarme", route: "/register", btnStyle: null, 
                            callback: (){
                              if(_typeUser != null && _showWarning){
                                setState(() {
                                  _showWarning = false;
                                });  
                                return false;
                              }

                              if(_typeUser == null){
                                setState(() {
                                  _showWarning = true;
                                });  
                                return false;
                              }

                              if(_key.currentState!.validate()){
                                
                                _key.currentState!.save();
                                // print("valido");
                                // _authController.register(context, _userController.text, _passwordController.text);
                                return(false);
                              }
                            }
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    )
                  ),
                ],
                  ),
                const Bottom()
              ]  
            ),
          ],
        ),
    );
  }
}