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
  const RegisterShipping({super.key});

  @override
  State<RegisterShipping> createState() => _RegisterShippingState();
}

class _RegisterShippingState extends State<RegisterShipping> {
  final String apiKey = "AIzaSyCBOL-BpBaIpomnAKVHZso_NqjL3z9hDNU";
  List<AutocompletePrediction> placePredictions = [];

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
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        "key": apiKey
      }
    );

    String? response = await AuthController.fetchUrl(uri);

    log(response.toString());
    if(response!=null){
      PlaceAutocompleteResponse result = PlaceAutocompleteResponse.parseAutocompleteResult(response);
      setState(() {
        placePredictions = result.predictions!;
      });
      // print(response); 
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < placePredictions.length; i++) {
      children.add(LocationListTile(location: placePredictions[i].description!, press: (){}));
    }


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
                  Input(controller: TextEditingController(), inputText: "Nombre:"),
                  const SizedBox(height: 15,),
                  Input(controller: TextEditingController(), inputText: "Direccion:", onChange: placeAutocomplete,),
                  ...children
                ],
              ),
            ),
            
            const SizedBox(height: 20,),
            title("Flete"),
            Divider(),
            FleteForm()
        ],
      ),
    );
  }
}