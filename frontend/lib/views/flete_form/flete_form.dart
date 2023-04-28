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
  FleteForm({super.key, required this.horaCargue, required this.horaDescargue, required this.horaECargue, required this.horaEDescargue, required this.conf, required this.origenVal, required this.destinoVal, required this.carga, required this.tipoTrans});
  
  // final String conf = "";

  final TextEditingController horaCargue ;
  final TextEditingController horaDescargue ;
  final TextEditingController horaECargue ;
  final TextEditingController horaEDescargue;

  final String conf;
  final String origenVal;
  final String destinoVal;
  final String carga;
  final String tipoTrans;

  @override
  Widget build(BuildContext context) {
    
    


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

                      SelectInput(list: origen, value: conf, label: '¿Donde se origina el viaje?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: destino, value: destinoVal, label: '¿Cual es el destino?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: confVehiculo, value: origenVal, label: '¿Cuál es la configuración de su vehículo?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: tipoCarga, value: carga, label: '¿Qué tipo de carga va a transportar?',),
                      SizedBox(height: height*0.025,),
                      SelectInput(list: tipoTransporte, value: tipoTrans, label: '¿Qué tipo de unidad de transporte va a emplear??',),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Input(controller: horaCargue, inputText: "¿Horas para el cargue?", width: width*0.42,),
                          const Spacer(),
                          Input(controller: horaDescargue, inputText: "¿Horas para el descargue?", width: width*0.42,),
                        ],
                      ),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Input(controller: horaECargue, inputText: "¿Horas de espera en el cargue?", width: width*0.42,),
                          const Spacer(),
                          Input(controller: horaEDescargue, inputText: "¿Horas de espera en el descargue?", width: width*0.42,),
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