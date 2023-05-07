import 'package:flutter/material.dart';
import 'package:frontend/views/generate_qr/generate_qr.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/register_shipping/register_shipping.dart';
import 'package:frontend/views/scan_qr/scan_qr.dart';
import 'package:frontend/views/shipping_details/shipping_details.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
import 'package:frontend/views/test/test.dart';
import 'package:frontend/views/user/user.dart';
import '../views/home_supervisor/home_supervisor.dart';
import '../views/initial_page/initial_page.dart';
import '../views/introduction/introduction.dart';
import '../views/login/login.dart';
import '../views/register/register.dart';
import '../views/flete/flete.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    
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
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_)=> HomeSupervisor(id: args,));
      
      case "/initial-page":
        return MaterialPageRoute(builder: (_)=> const InitialPage());
      
      case "/home":
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_)=> Home(id: args,));
      
      case "/scan-qr":
        final args = settings.arguments as List<int>;
        return MaterialPageRoute(builder: (_)=> ScanQR(idEnvio: args[0], idUser: args[1], estado: args[2],));

      case "/generate-qr":
        final args = settings.arguments as QrGenerator;
        return MaterialPageRoute(builder: (_)=>  GenerateQR(hasAppbar: args.hasAppBar, title: args.title, qrData: args.qrData, ));

      case "/shippings-driver":
        int arg = settings.arguments as int;
        return MaterialPageRoute(builder: (_)=> ShippingsDriver(idConductor: arg,));

      case "/test":
        return MaterialPageRoute(builder: (_)=> const Test());

      case "/user":
        final args = settings.arguments as UserView;
        return MaterialPageRoute(builder: (_)=> User(hasAppbar: args.hasAppBar, email: args.email, name: args.name, password: args.password, id: args.id, updateUser: args.updateUser,));

      case "/register-shipping":
        int arg = settings.arguments as int;
        return MaterialPageRoute(builder: (_)=> RegisterShipping(userId: arg,));

      case "/flete":
        Shipping envio = settings.arguments as Shipping;
        return MaterialPageRoute(builder: (_) => Flete(envio: envio,));

      case "/shippings-details":
        Shipping envio = settings.arguments as Shipping;
        return MaterialPageRoute(builder: (_) => ShippingDetails(envios: envio));

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
  final int qrData;

  QrGenerator(this.hasAppBar, this.title, this.qrData);

}

class UserView{
  final bool hasAppBar;
  final String name;
  final String email;
  final String password;
  final int id;
  final Function updateUser;


  UserView({required this.hasAppBar, required this.name, required this.email, required this.password, required this.id, required this.updateUser});
  
}