import 'package:flutter/material.dart';
import 'package:frontend/widgets/routing_button.dart';

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
        body: 
        Center(

        child: Column(
          children: [
            Form(
              key: _key,
              child: Column(
                children: [

                ],
              ),
            ),
            RoutingButton(text: "Iniciar Sesion", route: "/login", btnStyle:  null, 
            callback: (){
              print("Prubea uwu");
            }
            )
          ]  
        ),
      ),
      );
  }
}