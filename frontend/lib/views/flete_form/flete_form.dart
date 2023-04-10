import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/views/flete_form/widgets/input.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:frontend/views/register/widgets/text_input.dart';
import 'package:google_fonts/google_fonts.dart';

class FleteForm extends StatelessWidget {
  FleteForm({super.key});

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
                  // Input(controller: controller, inputText: inputText)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}