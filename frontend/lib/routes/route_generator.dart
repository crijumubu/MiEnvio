import 'package:flutter/material.dart';
import 'package:frontend/views/flete_form/flete_form.dart';
import 'package:frontend/views/generate_qr/generate_qr.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/register_shipping/register_shipping.dart';
import 'package:frontend/views/scan_qr/scan_qr.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
import 'package:frontend/views/test/test.dart';
import 'package:frontend/views/user/user.dart';
import '../views/home_supervisor/home_supervisor.dart';
import '../views/initial_page/initial_page.dart';
import '../views/introduction/introduction.dart';
import '../views/login/login.dart';
import '../views/register/register.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    // final args = settings.arguments;
    // settings.
    

    // print(args.runtimeType);

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
        final args = settings.arguments as Usuario;
        return MaterialPageRoute(builder: (_)=>  HomeSupervisor(user: args,));
      
      case "/initial-page":
        return MaterialPageRoute(builder: (_)=> const InitialPage());
      
      case "/home":
        final args = settings.arguments as Usuario;
        return MaterialPageRoute(builder: (_)=> Home(user: args,));
      
      case "/scan-qr":
        return MaterialPageRoute(builder: (_)=> ScanQR());

      case "/generate-qr":
        final args = settings.arguments as QrGenerator;
        return MaterialPageRoute(builder: (_)=>  GenerateQR(hasAppbar: args.hasAppBar, title: args.title, qrData: args.qrData, ));

      case "/shippings-driver":
        return MaterialPageRoute(builder: (_)=> ShippingsDriver());

      case "/flete-form":
        return MaterialPageRoute(builder: (_)=> FleteForm());

      case "/test":
        return MaterialPageRoute(builder: (_)=> const Test());

      case "/user":
        final args = settings.arguments as UserView;
        return MaterialPageRoute(builder: (_)=> User(hasAppbar: args.hasAppBar, email: args.email, name: args.name, password: args.password,));

      case "/register-shipping":
        return MaterialPageRoute(builder: (_)=> const RegisterShipping());

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

class QrGenerator{
  final bool hasAppBar;
  final String title;
  final double qrData;

  QrGenerator(this.hasAppBar, this.title, this.qrData);

}

class UserView{
  final bool hasAppBar;
  final String name;
  final String email;
  final String password;



  UserView({required this.hasAppBar, required this.name, required this.email, required this.password});
  
}