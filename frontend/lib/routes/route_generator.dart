import 'package:flutter/material.dart';
import 'package:frontend/pages/initial_page.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/register.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    print(args);

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const InitialPage());
        
      case "/login":
        return MaterialPageRoute(builder: (_) => const Login());

      case "/register":
        return MaterialPageRoute(builder: (_) => const Register());

      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("ERROR RUTA", style: TextStyle(fontSize: 32),)
          ],
        ),
      )
      );
    });
  }
}