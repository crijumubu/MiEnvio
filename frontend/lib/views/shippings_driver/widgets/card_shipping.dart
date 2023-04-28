import 'package:flutter/material.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
import 'package:frontend/views/shippings_driver/widgets/map.dart';
import 'package:google_fonts/google_fonts.dart';

class CardShipping extends StatelessWidget {
  const CardShipping({super.key, required this.shipping});
  final Shipping shipping;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MapSample()));
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffDAD7CD),
            borderRadius: BorderRadius.all(Radius.circular(8))
    
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.nombre, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w700, fontSize: 20, color: const Color(0xff344E41)),
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.origen, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontSize: 15),
                    
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.destino, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontSize: 16),
                  )
                ),
              ],
            ),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Text("Ver mapa", style: GoogleFonts.rubik(color:const Color(0x881D2A1D)),),
                const SizedBox(width: 5,),
                const Icon(Icons.map_rounded, color: Color(0x881D2A1D),),
              ],
            )
          ],
        ),
      ),
    );
  }
}