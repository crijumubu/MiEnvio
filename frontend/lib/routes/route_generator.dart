import 'package:flutter/material.dart';
import 'package:frontend/views/flete_form/flete_form.dart';
import 'package:frontend/views/generate_qr/generate_qr.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/scan_qr/scan_qr.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
import 'package:frontend/views/test/test.dart';
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

      case "initial-page":
        return MaterialPageRoute(builder: (_)=> const InitialPage());
        
      case "/login":
        return MaterialPageRoute(builder: (_) => const Login());

      case "/register":
        return MaterialPageRoute(builder: (_) => const Register());

      case "/home-supervisor":
        return MaterialPageRoute(builder: (_)=> const HomeSupervisor());
      
      case "/initial-page":
        return MaterialPageRoute(builder: (_)=> const InitialPage());
      
      case "/home":
        return MaterialPageRoute(builder: (_)=> const Home());
      
      case "/scan-qr":
        return MaterialPageRoute(builder: (_)=> const ScanQR());

      case "/generate-qr":
        return MaterialPageRoute(builder: (_)=> const GenerateQR());

      case "/shippings-driver":
        return MaterialPageRoute(builder: (_)=> ShippingsDriver());

      case "/flete-form":
        return MaterialPageRoute(builder: (_)=> FleteForm());

      case "/test":
        return MaterialPageRoute(builder: (_)=> const Test());

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