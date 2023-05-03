import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../controller/auth_controller.dart';
import '../initial_page/widgets/routing_button.dart';
import '../register/widgets/bottom.dart';
import '../register/widgets/header_back.dart';
import '../register/widgets/text_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController _authController = AuthController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: headerBack(context),
        bottomSheet: const SizedBox(
          height: 100,
          width: double.infinity,
          child: Bottom(),
        ) ,
        body: 
          Center(
            child: Padding(
              // color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Iniciar Sesion", style: GoogleFonts.rubik(fontSize: 38, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 30,),
                  TextInput(fieldController: _userController, placeholder: "Email",  inputType: 'email'),
                  const SizedBox(height: 20,),
                  TextInput(fieldController: _passwordController, placeholder:  "Contraseña", inputType: 'password',),
                  const SizedBox(height: 20,),
                  RoutingButton(text: "Iniciar Sesion", route: "/home", btnStyle: null, 
                    callback: (){
                      if(_key.currentState!.validate()){
                        setState(() {
                          _loading = true;
                        });
                        _key.currentState!.save();
                        _authController.login(context, _userController.text, _passwordController.text).then((value){
                            setState(() {
                            _loading = false;
                          });
                        });
                        // return(true);
                      }
                    }
                  ),
                ],
              ),
            )),
          ),
      ),
    );
  }
}