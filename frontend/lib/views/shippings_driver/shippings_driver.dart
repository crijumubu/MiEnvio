import 'package:flutter/material.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:frontend/views/shippings_driver/widgets/card_shipping.dart';
import 'package:google_fonts/google_fonts.dart';

import '../register/widgets/bottom.dart';

class Shipping{
  String name;
  String origin;
  String destination;


  Shipping({required this.name, required this.destination, required this.origin});
}

List<Shipping> envios = [Shipping(name: "BOG-BGA", destination: "Bucaramanga", origin: "Bogota"),
Shipping(name: "BOG-MED", destination: "Medellin", origin: "Bogota"),
Shipping(name: "BOG-MED", destination: "Medellin", origin: "Bogota"),
Shipping(name: "BOG-MED", destination: "Medellin", origin: "Bogota"),
Shipping(name: "BOG-MED", destination: "Medellin", origin: "Bogota"),
Shipping(name: "BOG-MED", destination: "Medellin", origin: "Bogota"),
Shipping(name: "BOG-MED", destination: "Medellin", origin: "Bogota"),
];

class ShippingsDriver extends StatelessWidget {
  ShippingsDriver({super.key});
  late double height = 0;

  @override
  Widget build(BuildContext context) {

    if(height == 0) height = MediaQuery.of(context).size.height;
    List enviosCard = [];
    for(var i in envios){
      enviosCard.add(CardShipping(shipping: i));
      enviosCard.add(const SizedBox(height: 10));
    }
    
    return Scaffold(
      appBar: headerBack(context),
      // bottomSheet: Container(
      //   height: 80,
      //   decoration:  BoxDecoration(
      //     color: Colors.grey[100],
      //     boxShadow: const [
      //         BoxShadow(color: Color.fromARGB(255, 144, 143, 143), blurRadius: 30.0, offset: Offset(0, -5), spreadRadius: 1 )
      //       ]
      //   ),
      //   child: const Center(child: BottomBL(),),
      // ),
      body: ListView(
        
        children: [
          Padding(
            padding: EdgeInsets.only(top: height*0.03, bottom: 20),
            // color: Colors.amber[100],
            child: Center(child: Text("Viajes Asignados", style: GoogleFonts.rubik(fontSize: 36, fontWeight: FontWeight.w700),)),
          ),
          ...enviosCard,
          const Bottom()
          // Expanded(
          //   child: ListView.separated(
              
          //     itemCount: envios.length,
          //     itemBuilder: (BuildContext context, int index){
          //       return CardShipping(shipping: envios[index]
          //       );
          //     },
          //     separatorBuilder: (BuildContext context, int index ) => const SizedBox(height: 10,),
              
              
          //   ),
          // )
        ],
      ),
    );
  }
}