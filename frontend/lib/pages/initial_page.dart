
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/widgets/logo.dart';
import 'package:frontend/widgets/routing_button.dart';
import 'package:google_fonts/google_fonts.dart';


class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children:  [
                    Text("MOBITIENDA", style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black, letterSpacing: 3),),
                    const SizedBox(height: 16,),
                    const Logo(opacity: 1, size: "200"),
                    const SizedBox(height: 16,),
                    RoutingButton(text: "Iniciar Sesion", route: "/login", callback: (){return true;},),
                    const SizedBox(height: 5,),
                    RoutingButton(text: "No tengo una cuenta", route: "/register", callback: (){return true;}, 
                    btnStyle: ElevatedButton.styleFrom(
                      elevation: 0,
                      // disabledBackgroundColor:Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      backgroundColor: Colors.grey[50],
                      textStyle: const TextStyle(color: Colors.black)

                      ),
                    ),
                    RoutingButton(text: "Home", route: "/home-supervisor", callback: (){return true;},),
                  ],
                )
              ],
            ),
            
          ], 
        ),
      ),
    );
  }
}

