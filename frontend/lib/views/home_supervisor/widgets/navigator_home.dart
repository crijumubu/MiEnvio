import 'package:flutter/material.dart';
import 'package:frontend/views/home_supervisor/widgets/header.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shippings_driver/shippings_driver.dart';
import '../../shippings_driver/widgets/card_shipping.dart';

class NavigatorHome extends StatelessWidget {
  const NavigatorHome({super.key, required this.height});
  final double height;
  // get enviosCard => null;

  GestureDetector btnIcon({required IconData icon, required String text}){
    return GestureDetector(
      onTap: (){},
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xffDAD7CD),  
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Color(0xff344E41),),
              Text(text, style: GoogleFonts.rubik(fontSize: 16, color: Color(0xff344E41)),)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List enviosCard = [];
    for(var i in envios){
      enviosCard.add(CardShipping(shipping: i));
      enviosCard.add(const Divider(thickness: 1, height: 0,));
    }
    
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:10, right: 30),
          // padding: EdgeInsets.all(10),
          height: height*0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff344E41),
            borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 10,),
                // Header(),
                SizedBox(
                  width: double.infinity,
                  child: Text("Bienvenido User", style: GoogleFonts.rubik(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis,)
                ),
                SizedBox(height: 3,),
                SizedBox(
                  width: double.infinity,
                  child: Expanded(
                    child: Text("Te recomendamos revisar los envios activos", style: GoogleFonts.rubik(fontSize: 14, color: Colors.white, fontStyle: FontStyle.italic),)
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Text("Envios Activos", style: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),)
        ),
        Divider(
          thickness: 1,
          // indent: 8,
        ),
        ...enviosCard,
        Divider(thickness: 1,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              btnIcon(icon: Icons.local_shipping_outlined, text: "Nuevo Envio"),
               Spacer(),
              btnIcon(icon: Icons.change_circle_outlined, text: "Actualizar Envio"),
            ],
          ),
        )
          
          // ElevatedButton(
          //   onPressed: (){}, 
          //   child: Text("Asignar Conductor"),
          // ),
          // ElevatedButton(
          //   onPressed: (){}, 
          //   child: Text("Actualizar envio"),
          // ),
          // ElevatedButton(
          //   onPressed: (){}, 
          //   child: Text("Registrar nuevo envio"),
          // )
      ],
    );
  }
}