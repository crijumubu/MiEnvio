import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/alerts.dart';
import '../widgets/bottom.dart';
import '../widgets/header_back.dart';
import '../widgets/routing_button.dart';
import '../widgets/text_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> { 
  final AuthController _authController = AuthController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBack(context),
      resizeToAvoidBottomInset: false,
      body: 
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded( flex: 10,child: 
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Registrarme", style: GoogleFonts.rubik(fontSize: 38, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 45,),
                  TextInput(fieldController: _userController, placeholder: "Usuario", hide: false,),
                  const SizedBox(height: 22,),
                  TextInput(fieldController: _passwordController, placeholder:  "Contraseña", hide: true,),
                  const SizedBox(height: 22,),
                  TextInput(fieldController: _passwordConfCont, placeholder:  "Confirmar Contraseña", hide: true, checkPasswords: _passwordController,),
                  const SizedBox(height: 32,),
                  RoutingButton(text: "Registrarme", route: "/register", btnStyle: null, 
                    callback: (){
                      if(_key.currentState!.validate()){
                        _key.currentState!.save();
                        _authController.register(context, _userController.text, _passwordController.text);
                        return(false);
                      }
                    }
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ))
            ),
            const Expanded(flex: 3, child: 
             Bottom()
            )
          ]  
        ),
      ),
    );
  }
}