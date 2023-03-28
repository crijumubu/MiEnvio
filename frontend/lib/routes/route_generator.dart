import 'package:flutter/material.dart';
import '../views/home_supervisor/home_supervisor.dart';
import '../views/initial_page/initial_page.dart';
import '../views/introduction/introduction.dart';
import '../views/login/login.dart';
import '../views/register/register.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    // final args = settings.arguments;

    // print(args);

    switch (settings.name) {
      case "introduction":
        return MaterialPageRoute(builder: (_) => const Introduction());
        
      case "/login":
        return MaterialPageRoute(builder: (_) => const Login());

      case "/register":
        return MaterialPageRoute(builder: (_) => const Register());

      case "/home-supervisor":
        return MaterialPageRoute(builder: (_)=> const HomeSupervisor());
      
      case "/initial-page":
        return MaterialPageRoute(builder: (_)=> const InitialPage());
      
      case "initial-page":
        return MaterialPageRoute(builder: (_)=> const InitialPage());

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