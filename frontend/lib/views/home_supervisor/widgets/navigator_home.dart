import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shippings_driver/shippings_driver.dart';
import '../../shippings_driver/widgets/map.dart';

class NavigatorHome extends StatelessWidget {
  const NavigatorHome({super.key, required this.height});
  final double height;

  GestureDetector btnIcon({required IconData icon, required String text}){
    return GestureDetector(
      onTap: (){},
      child: Center(
        child: Container(
          width: 120,
          // height: 90,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xff3A5A40),  
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(141, 141, 141, 1), blurRadius: 3)
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.white,),
              Text(text, style: GoogleFonts.rubik(fontSize: 16, color: Colors.white),)
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
      enviosCard.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ActiveShippings(shipping: i),
      ));
      if(envios.last != i) enviosCard.add(SizedBox(height: 10,));
      
    }
    
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:10, right: 30),
          height: height*0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff344E41),
            borderRadius: BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Bienvenido, ", 
                          // style: GoogleFonts.rubik(fontWeight: FontWeight.bold)  
                        ),
                        TextSpan(
                          text: "User",
                          style: GoogleFonts.rubik(fontWeight: FontWeight.bold)  
                        )
                      ],
                      style: GoogleFonts.rubik(fontSize: 28,) //fontStyle: FontStyle.italic)
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3,),
                SizedBox(
                  width: double.infinity,
                  child: Text("Te recomendamos revisar los envios activos", style: GoogleFonts.rubik(fontSize: 14, color: Colors.white, fontStyle: FontStyle.italic),),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text("Envios Activos", style: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w700),)
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
              btnIcon(icon: Icons.local_shipping_outlined, text: "Registrar"),
               Spacer(),
              btnIcon(icon: Icons.change_circle_outlined, text: "Actualizar"),
            ],
          ),
        )
      ],
    );
  }
}

class ActiveShippings extends StatelessWidget {
  const ActiveShippings({super.key, required this.shipping});
  final  Shipping shipping;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MapSample()));
      },
      child: Container(
        decoration:  BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [BoxShadow(color: Color.fromRGBO(224, 224, 224, 1), blurRadius: 3)]
    
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
                    shipping.name, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 20, color: const Color(0xff344E41)),
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.origin, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w400),
                    
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.destination, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ),
              ],
            ),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Text("Ver en mapa", style: GoogleFonts.rubik(color:const Color(0xffA3B18A)),),
                const SizedBox(width: 5,),
                const Icon(Icons.not_listed_location_rounded, color: Color(0xff588157),),
              ],
            )
          ],
        ),
      ),
    );
  }
}