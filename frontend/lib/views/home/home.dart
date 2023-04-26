import 'package:flutter/material.dart';
import 'package:frontend/views/home/widgets/menu_button.dart';
import 'package:frontend/views/register/widgets/bottom.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomSheet: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/home-supervisor");
        },
        child: const SizedBox(
          height: 90,
          child: Center(child: Bottom())
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false ,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: MediaQuery.of(context).size.height*0.25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff344E41),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                    ),
                    child:  Center(
                      child: Row(
                        children: [
                          const SizedBox(width: 30,),
                          RichText(
                            text:  TextSpan(
                              children: [
                                TextSpan(
                                  text: "Bienvenido\n",
                                  style: GoogleFonts.rubik(
                                    fontSize: 24,
                                  )

                                ),
                                TextSpan(
                                  text: "Username",
                                  style: GoogleFonts.rubik(
                                    fontSize: 32,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                  )
                                )
                              ]
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "initial-page");
                            }, 
                            child: Image.asset("assets/images/logout.png", scale: 17, color: const Color(0xffffffff),)
                          ),
                          const SizedBox(width: 5,),
                        ],
                      )
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 50,),
              Center(
                child: Wrap(
                  children: const [
                    MenuButton(text: 'Viajes', imgRoute: 'delivery2.png', btnRoute: '/shippings-driver',),
                    MenuButton(text: 'Escanear QR', imgRoute: 'camara.png', btnRoute: '/scan-qr',),
                    MenuButton(text: 'Generar QR', imgRoute: 'codigo-qr.png', btnRoute: '/generate-qr',),
                    MenuButton(text: 'Perfil', imgRoute: 'user.png', btnRoute: '/test',),
                  ],
                ),
              )

        
            ],
          ),
        ),
      ),
    );
  }
}