import 'package:flutter/material.dart';
import 'package:frontend/views/home/widgets/menu_button.dart';
import 'package:frontend/views/register/widgets/bottom.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/home-supervisor");
        },
        child: const SizedBox(
          height: 100,
          child: Center(child: Bottom())
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false ,
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 20,
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, "initial-page");
                }, 
                child: Image.asset("assets/images/logout.png", scale: 12, color: const Color(0xff344E41),)
              ),
            ),
      
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bienvenido\nusername", style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.bold), textAlign:TextAlign.center,),
                  const SizedBox(height: 70,),
                  Wrap(
                    children: const [
                      MenuButton(text: 'Envios', imgRoute: 'delivery2.png', btnRoute: '',),
                      MenuButton(text: 'Escanear QR', imgRoute: 'camara.png', btnRoute: '/scan-qr',),
                      MenuButton(text: 'Generar QR', imgRoute: 'codigo-qr.png', btnRoute: '/generate-qr',),
                      MenuButton(text: 'Perfil', imgRoute: 'user.png', btnRoute: '',),
                    ],
                  )
            
            
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}