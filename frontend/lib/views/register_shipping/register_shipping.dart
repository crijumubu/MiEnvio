import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/flete_form/flete_form.dart';
import 'package:frontend/views/flete_form/widgets/input.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:frontend/views/register_shipping/widgets/location_list_tile.dart';
import 'package:frontend/views/register_shipping/widgets/place_autocomplete_response.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterShipping extends StatefulWidget {
  const RegisterShipping({super.key, required this.userId});
  final int userId;

  @override
  State<RegisterShipping> createState() => _RegisterShippingState();
}

class _RegisterShippingState extends State<RegisterShipping> {
  final String apiKey = "AIzaSyCBOL-BpBaIpomnAKVHZso_NqjL3z9hDNU";
  List<AutocompletePrediction> placePredictions = [];
  final TextEditingController _nombre = TextEditingController();
  // String direction = "";
  final TextEditingController _direccion = TextEditingController();
  final TextEditingController horaCargue = TextEditingController() ;
  final TextEditingController horaDescargue = TextEditingController() ;
  final TextEditingController horaECargue = TextEditingController() ;
  final TextEditingController horaEDescargue = TextEditingController();

  final String conf = "";
  final String origenVal = "";
  final String destinoVal = "";
  final String carga = "";
  final String tipoTrans = "";

  final AuthController _authController = AuthController();

  

  SizedBox title(String title){
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(title,
          style: GoogleFonts.rubik(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void placeAutocomplete(String query)async{
    // print(query);
    if(query != ""){
      Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {
          "input": query,
          "key": apiKey
        }
      );

      String? response = await AuthController.fetchUrl(uri);

      if(response!=null){
        PlaceAutocompleteResponse result = PlaceAutocompleteResponse.parseAutocompleteResult(response);
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }else{
      setState(() {
        placePredictions = [];
      });
    }
  }

  void onPressTile(String location){

    setState(() {
      _direccion.value = TextEditingValue(
        text: location,
        selection: TextSelection.fromPosition(
          TextPosition(offset: location.length),
        ),
      );
      // _direccion.new
      

      placePredictions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < placePredictions.length; i++) {
      children.add(LocationListTile(location: placePredictions[i].description!, press: onPressTile));
    }
    double predictionsHeight = placePredictions.length * 58;

    return Scaffold(
      backgroundColor: Colors.grey[100],    
      appBar: headerBack(context),
      body: ListView(
        children: [
            const SizedBox(height: 20,),
            Center(child: Text("Registrar Envio", style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.w700),)),
            const SizedBox(height: 30,),
            title("Informacion General"),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Input(controller: _nombre, inputText: "Nombre:"),
                  const SizedBox(height: 15,),
                  Input(controller: _direccion, inputText: "Dirección:", onChange: placeAutocomplete),

                  AnimatedContainer(
                    height: (placePredictions.length == 0)? 0:predictionsHeight,
                    duration: Duration(milliseconds: 300),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        // borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
                      ),
                      child: Column(
                        children: children,
                      ),
                    ),
                  )

                ],
              ),
            ),
            
            const SizedBox(height: 20,),
            title("Flete"),
            Divider(),
            FleteForm(carga: carga, conf: conf, destinoVal: destinoVal, horaCargue: horaCargue, horaDescargue: horaDescargue, horaECargue: horaECargue, horaEDescargue: horaEDescargue, origenVal: origenVal, tipoTrans: tipoTrans, ),
            const SizedBox(height: 20,),
            Column(
              children: [
                SizedBox(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      // side: BorderSide(color: Colors.white),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      backgroundColor: Color(0xff3344E41),
                      shadowColor:Color.fromRGBO(224, 224, 224, 1)
                    ),
                    onPressed: (){
                      // print(widget.userId);
                      final int horasEspera = int.parse(horaCargue.text) + int.parse(horaDescargue.text) + int.parse(horaECargue.text) + int.parse(horaEDescargue.text) ;
                      final envio = NewShipping(_nombre.text, horasEspera.toDouble(), 1111, 1111, widget.userId, 1111, 1111, 1111, 1111, 1111, 1111, 1111,origenVal, destinoVal,_direccion.text, 1,
                  );
                      _authController.registerShipping(envio);
                      // print(envio);
                    }, 
                    child: Text("Registrar Envio", style: GoogleFonts.rubik(color: Colors.white, fontSize: 18, fontWeight:    FontWeight.w500 ),
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),

        ],
      ),
    );
  }
}

class NewShipping{
  final String nombre;
  final double horasEspera;
  final double costoTonelada;
  final double toneladaKilometro;
  final int idUsuario;
  final double costocarga;
  final double costoHoraadicional;
  final double costoTiempoEspera;
  final double toneladaKilometroViaje;
  final double toneladaViaje;
  final double costoKilometro;
  final double costoKilometroViaje;
  final String origen;
  final String destino;
  final String direccion;
  final int estado;

  NewShipping(this.nombre, this.horasEspera, this.costoTonelada, this.toneladaKilometro, this.idUsuario, this.costocarga, this.costoHoraadicional, this.costoTiempoEspera, this.toneladaKilometroViaje, this.toneladaViaje, this.costoKilometro, this.costoKilometroViaje, this.origen, this.destino, this.direccion, this.estado);
}