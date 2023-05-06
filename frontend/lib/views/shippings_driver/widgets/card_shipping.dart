import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
import 'package:frontend/views/shippings_driver/widgets/shipping_detailed.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CardShipping extends StatelessWidget {
  const CardShipping({super.key, required this.shipping});
  final Shipping shipping;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: ()async{
        final String apiKey = "AIzaSyD72vikPUNNUwfZwPGqU_PYPvC9QnsmBl8";
        print(shipping.direccion);
        Uri uri = Uri.https(
          "maps.googleapis.com",
          "maps/api/geocode/json",
          {
            "address": shipping.direccion,
            "key": apiKey
          }
        );
        String? response = await AuthController.addressToLatLn(uri);
        if(response!= null){
          var data = jsonDecode(response);
          
          // print(data['results'][0]["geometry"]["location"]);
          double lat = data['results'][0]["geometry"]["location"]["lat"];
          double lng = data['results'][0]["geometry"]["location"]["lng"];
          log("$lat $lng");
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingDetailed(initialPos: LatLng( lat, lng), envio: shipping,)));

        }


        // log((response ?? "no hay na"));

      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
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
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: shipping.nombre,
                          style: GoogleFonts.rubik(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff344E41)),
                        ),
                        TextSpan(
                          text: (shipping.estado == 2) ? " (Activo)": " (Finalizado)",
                          style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 20, color: (shipping.estado == 2) ? Colors.green : Colors.grey),
                        )
                      ],
                    ), 
                    textAlign: TextAlign.left,
                    
                    
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