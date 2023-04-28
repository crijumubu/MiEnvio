import 'package:flutter/material.dart';
import 'package:frontend/views/flete_form/widgets/input.dart';
import 'package:frontend/views/flete_form/widgets/select_input.dart';
// import 'package:intl/intl.dart';

List<String> confVehiculo = ["Camión dos ejes - Sencillo", "Tractocamión dos ejes - Patineta - Minimula con semiremolque de dos ejes", "Tractocamión dos ejes - Patineta - Minimula con semiremolque de tres ejes", "Camión tres ejes - Dobletroque", "Tractocamión tres ejes - Tractomula con semiremolque de dos ejes", "Tractocamión tres ejes - Tractomula con semiremolque de tres ejes"];
List<String> tipoCarga = ["General","Contenedor","Carga Refrigerada","Granel Sólido",];
List<String> tipoTransporte = ["Estacas", "Furgon", "Trayler", "Termoking"];
List<String> origen = ["Bucaramanga"];
List<String> destino = ["Bogota"];
// List<String> tipoCarga = [];




class FleteForm extends StatelessWidget {
  FleteForm({super.key});
  
  // final String conf = "";

  final TextEditingController horaCargue = TextEditingController();
  final TextEditingController horaDescargue = TextEditingController();
  final TextEditingController horaECargue = TextEditingController();
  final TextEditingController horaEDescargue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    String conf = "";
    String carga = "";
    String tipoTrans = "";


    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;


    // final now = DateTime.now();
    // final year = DateFormat.y().format(now); // Extract year
    // final month = now.month.toString().padLeft(2, '0');

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                // SizedBox(height: height*0.03,),
                
                // SizedBox(height: height*0.03,),
                Form(
                  child: Column(
                    children:  [
                      // Row(
                      //   children: [
                      //     Text("Periodo:",
                      //       style: GoogleFonts.rubik(fontSize: 18),
                      //     ),
                      //     // Text("$year$month",
                      //     //   style: GoogleFonts.rubik(fontSize: 18),
                      //     // ),
                      //   ],
                      // ),
                      // DatePicker(),
                      SelectInput(list: origen, value: conf, label: '¿Donde se origina el viaje?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: destino, value: conf, label: '¿Cual es el destino?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: confVehiculo, value: conf, label: '¿Cuál es la configuración de su vehículo?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: tipoCarga, value: carga, label: '¿Qué tipo de carga va a transportar?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: tipoTransporte, value: tipoTrans, label: '¿Qué tipo de unidad de transporte va a emplear??',),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Input(controller: horaCargue, inputText: "¿Horas para el cargue?", width: width*0.42,),
                          const Spacer(),
                          Input(controller: horaCargue, inputText: "¿Horas para el descargue?", width: width*0.42,),
                        ],
                      ),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Input(controller: horaCargue, inputText: "¿Horas de espera en el cargue?", width: width*0.42,),
                          const Spacer(),
                          Input(controller: horaCargue, inputText: "¿Horas de espera en el descargue?", width: width*0.42,),
                        ],
                      ),
                      // SizedBox(height: height*0.025,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
  }
}