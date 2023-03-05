import 'package:flutter/material.dart';
import 'package:frontend/widgets/bottom.dart';
import 'package:frontend/widgets/header_back.dart';
import 'package:frontend/widgets/routing_button.dart';
import 'package:frontend/widgets/text_input.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: headerBack(context),
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
                  Text("Iniciar Sesion", style: GoogleFonts.rubik(fontSize: 38, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 64,),
                  TextInput(fieldController: _userController, placeholder: "Usuario", hide: false,),
                  const SizedBox(height: 32,),
                  TextInput(fieldController: _passwordController, placeholder:  "Contraseña", hide: true,),
                  const SizedBox(height: 38,),
                  RoutingButton(text: "Iniciar Sesion", route: "/login", btnStyle: null, 
                    callback: (){
                      if(_key.currentState!.validate()){
                        _key.currentState!.save();
                        return(true);
                      }
                    }
                  )
                ],
              ),
            ))
            ),
            const Expanded(flex: 4, child: 
             Bottom()
            )
          ]  
        ),
      ),
    );
  }
}