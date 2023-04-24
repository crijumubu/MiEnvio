import 'package:flutter/material.dart';
import 'package:frontend/views/home_supervisor/widgets/header.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shippings_driver/shippings_driver.dart';
import '../shippings_driver/widgets/card_shipping.dart';
import 'widgets/navigation.dart';

class HomeSupervisor extends StatefulWidget {
  const HomeSupervisor({super.key});

  @override
  State<HomeSupervisor> createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
  int index = 0;
  Navigation ?navigation;
  late double height = 0;

  @override
  void initState() {

    navigation = Navigation(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    if(height == 0) height = MediaQuery.of(context).size.height;
    List enviosCard = [];
    for(var i in envios){
      enviosCard.add(CardShipping(shipping: i));
      enviosCard.add(const SizedBox(height: 10));
    }

    return Scaffold(
      bottomNavigationBar: navigation,
      // appBar: AppBar(
      //   title:  Image(
      //     image: const AssetImage("assets/images/logo200.png"),
      //     color: Colors.white.withOpacity(0.5),
      //     colorBlendMode: BlendMode.modulate,
      //     height: 100
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.white,
      //   leading: null,
      // ),
      
      body: Center(
      // padding: const EdgeInsets.all(1),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text("Envios Activos", style: GoogleFonts.rubik(fontSize: 30, fontWeight: FontWeight.bold),)
          ),
          Divider(thickness: 1,),
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all(color: Color(0xff344E41), width: 3, ),
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            //   color: Colors.grey[100]
            // ),
            padding: EdgeInsets.symmetric(horizontal: 10, ),
            height: 350,
            child: Expanded(
              child: SingleChildScrollView(
                // slivers: [...enviosCard],
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
      ),
      ));
  }
}