
import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/update_state.dart/update_status.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shippings_driver/shippings_driver.dart';
import '../../test/mymap.dart';

class NavigatorHome extends StatelessWidget {
  NavigatorHome({super.key, required this.height, required this.name, required this.id, required this.enviosShow});
  final double height;
  final String name;
  final int id;
  final List<Shipping?> enviosShow;
  final AuthController _authController = AuthController();

  GestureDetector btnIcon(context, {required IconData icon, required String text, required ruta}){
    return GestureDetector(
      onTap: (){
        if(ruta is String){
          Navigator.pushNamed(context, "$ruta", arguments: id);
        }else{
          ruta();
        }
      },
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
    // List<Widget> enviosCard = [];
    
    
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
                          text: "$name",
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

        // ? Future Builder de envios activos
        FutureBuilder(
          future: _authController.activeShippings(id),
          builder: (context, snapshot) {
            List<Widget> children;
            // print(snapshot.data);
            if(snapshot.hasData){
              // print(snapshot.data[0]["nombre"]);
              List<Shipping> enviosActivos = (snapshot.data as List<dynamic>).map((e) => Shipping(nombre: e["nombre"], idViaje: e["idViaje"], idUsuario: e["idUsuario"], origen: e["origen"], destino: e["destino"], estado: e["estado"], idConductor: e["idConductor"], direccion: e["direccion"])).toList();

              if(enviosActivos.isEmpty){
                children = [
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "No hay envios activos."),
                              TextSpan( text: "\nRecuerde asignar conductor a los envios pendientes.",style: GoogleFonts.rubik(fontWeight: FontWeight.bold))
                            ],
                            style: GoogleFonts.rubik(fontSize: 18, color: Colors.black)
                          ),
                          textAlign: TextAlign.center
                        ),
                      ),
                    )
                  )
                ];
              }else{
                List<Widget> enviosCard = [];
                for(var i in enviosActivos){
                  enviosCard.add(Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ActiveShippings(shipping: i),
                  ));
                  if(envios.last != i) enviosCard.add(SizedBox(height: 10,));
                }

                children = enviosCard;
              }
            }else if(snapshot.hasError){
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            }else{
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Consultando...'),
                ),
              ];
            }

            return Column(children: children);
          }
        ),
        // ...enviosCard,

        
        Divider(thickness: 1,),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              btnIcon(context, icon: Icons.local_shipping_outlined, text: "Registrar", ruta: '/register-shipping'),
               Spacer(),
              btnIcon(context, icon: Icons.change_circle_outlined, text: "Actualizar", ruta:() {Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateStatus(id: id, enviosList: enviosShow, filtersActive: [1,2])));}),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyMap("conductor${shipping.idConductor}", envio: shipping,)));
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
                    shipping.nombre, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 20, color: const Color(0xff344E41)),
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.origen, 
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w400),
                    
                  )
                ),
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Text(
                    shipping.destino, 
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