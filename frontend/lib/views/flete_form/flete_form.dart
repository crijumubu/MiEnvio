import 'package:flutter/material.dart';
import 'package:frontend/views/flete_form/widgets/select_input.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> confVehiculo = ["","Camión dos ejes - Sencillo", "Tractocamión dos ejes - Patineta - Minimula con semiremolque de dos ejes", "Tractocamión dos ejes - Patineta - Minimula con semiremolque de tres ejes", "Camión tres ejes - Dobletroque", "Tractocamión tres ejes - Tractomula con semiremolque de dos ejes", "Tractocamión tres ejes - Tractomula con semiremolque de tres ejes"];

class FleteForm extends StatelessWidget {
  FleteForm({super.key});
  String conf = "";

  final TextEditingController horaCargue = TextEditingController();
  final TextEditingController horaDescargue = TextEditingController();
  final TextEditingController horaECargue = TextEditingController();
  final TextEditingController horaEDescargue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: headerBack(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: height*0.03,),
            Text("Calcular Flete",
              style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Form(
              child: Column(
                children:  [
                  SelectInput(list: confVehiculo, value: conf)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}