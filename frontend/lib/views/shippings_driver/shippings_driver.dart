import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:frontend/views/shippings_driver/widgets/card_shipping.dart';
import 'package:google_fonts/google_fonts.dart';

import '../register/widgets/bottom.dart';

class Shipping{
  String nombre;
  int idViaje;
  int idUsuario;
  // int idFlete;
  String origen;
  String destino;
  int estado;
  int idConductor;
  String direccion;


  Shipping({required this.nombre, required this.idViaje, required this.idUsuario,required this.origen, required this.destino, required this.estado, required this.idConductor, required this.direccion});
}

List<Shipping> envios = [Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),
Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),
Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),
Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),
Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),
Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),
Shipping(nombre: "BOG-BGA", destino: "Bucaramanga", origen: "Bogota", estado: 1, idConductor: 3, idUsuario: 1, idViaje: 1, direccion: 'Calle',),

];

class ShippingsDriver extends StatelessWidget {
  ShippingsDriver({super.key, required this.idConductor});

  final int idConductor;
  
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    
    late double height = 0;
    if(height == 0) height = MediaQuery.of(context).size.height;
    List enviosCard = [];
    for(var i in envios){
      enviosCard.add(CardShipping(shipping: i));
      enviosCard.add(const SizedBox(height: 10));
    }
    
    return Scaffold(
      appBar: headerBack(context),
      body: ListView(
        
        children: [
          Padding(
            padding: EdgeInsets.only(top: height*0.03, bottom: 20),
            // color: Colors.amber[100],
            child: Center(child: Text("Viajes Asignados", style: GoogleFonts.rubik(fontSize: 36, fontWeight: FontWeight.w700),)),
          ),
          FutureBuilder(
            future: _authController.getShippingsDriver(idConductor),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<Widget> children;
              if(snapshot.hasData){
                // print(snapshot.data[0]["nombre"]);
                List<Shipping> enviosActivos = (snapshot.data as List<dynamic>).map((e) => Shipping(nombre: e["nombre"], idViaje: e["idViaje"], idUsuario: e  ["idUsuario"], origen: e["origen"], destino: e["destino"], estado: e["estado"], idConductor: e["idConductor"], direccion: e["direccion"])).toList();

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
                      child: CardShipping(shipping: i),
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
          
            },
          ),
          // ...enviosCard,
          const Bottom()
        ],
      ),
    );
  }
}