import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shippings_driver/shippings_driver.dart';
import '../../shippings_driver/widgets/card_shipping.dart';

class NavigatorHome extends StatelessWidget {
  const NavigatorHome({super.key});
  
  // get enviosCard => null;

  @override
  Widget build(BuildContext context) {
    List enviosCard = [];
    for(var i in envios){
      enviosCard.add(CardShipping(shipping: i));
      enviosCard.add(const SizedBox(height: 10));
    }

    return Column(
      children: [
        Padding(padding: EdgeInsets.only(bottom: 20)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text("Envios Activos", style: GoogleFonts.rubik(fontSize: 30, fontWeight: FontWeight.bold),)
          ),
          Divider(
            thickness: 1,
            // indent: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, ),
            height: 350,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(children: [...enviosCard],),
              ),
            ),
          ),
          Divider(thickness: 1,),
          ElevatedButton(
            onPressed: (){}, 
            child: Text("Asignar Conductor"),
          ),
          ElevatedButton(
            onPressed: (){}, 
            child: Text("Actualizar envio"),
          ),
          ElevatedButton(
            onPressed: (){}, 
            child: Text("Registrar nuevo envio"),
          )
      ],
    );
  }
}