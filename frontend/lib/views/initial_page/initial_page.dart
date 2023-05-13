
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/views/initial_page/widgets/routing_button.dart';

double anchoApp = 0;


class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  ElevatedButton userButton(img){
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        backgroundColor: const Color(0xffDAD7CD)
      ),
      child: Image.asset("assets/images/$img.png", width: 100,)
    );
  }

  @override
  Widget build(BuildContext context) {
    anchoApp = MediaQuery.of(context).size.width ;


    return WillPopScope(
      onWillPop: () async =>false,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/initial-page.png"), fit: BoxFit.fitHeight, colorFilter: ColorFilter.mode(Color(0xffA3B18A), BlendMode.modulate), ),
            color: Color(0xffA3B18A)
          ),
          child: BackdropFilter( filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0) ,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( 
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    decoration: const BoxDecoration(color: Color(0xffDAD7CD), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:
                    Column(
                      children:  [
                        const Image(
                          image: AssetImage("assets/images/logo200.png"),
                        ),
                        RoutingButton(text: "Iniciar Sesión", route: "/login", callback: (){
                            // Navigator.pushNamed(context, "/home");
                            return true;
                          },
                        ),
                        const SizedBox(height: 10,),
                        RoutingButton(text: "No tengo una cuenta", route: "/register", callback: (){return true;}, 
                        btnStyle: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          backgroundColor: const Color(0xffDAD7CD),
                          textStyle: const TextStyle(color: Colors.black)
    
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
              
            ], 
          ),
        ),
      )),
    );
  }
}

