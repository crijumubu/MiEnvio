import 'package:flutter/material.dart';
import 'package:frontend/views/flete_form/widgets/input.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> confVehiculo = [" ","Camión dos ejes - Sencillo", "Tractocamión dos ejes - Patineta - Minimula con semiremolque de dos ejes", "Tractocamión dos ejes - Patineta - Minimula con semiremolque de tres ejes", "Camión tres ejes - Dobletroque", "Tractocamión tres ejes - Tractomula con semiremolque de dos ejes", "Tractocamión tres ejes - Tractomula con semiremolque de tres ejes"];
List<String> tipoCarga = [" ","General","Contenedor","Carga Refrigerada","Granel Sólido",];
List<String> tipoTransporte = [" ","Estacas", "Furgon", "Trayler", "Termoking"];
List<String> origen = [" ","Bucaramanga"];
List<String> destino = [" ","Bogota"];
// List<String> tipoCarga = [];




// ignore: must_be_immutable
class FleteForm extends StatefulWidget {
  FleteForm({super.key, required this.horaCargue, required this.horaDescargue, required this.horaECargue, required this.horaEDescargue, required this.callback}); //required this.conf, required this.origenVal, required this.destinoVal, required this.carga, required this.tipoTrans});
  
  // final String conf = "";

  final TextEditingController horaCargue ;
  final TextEditingController horaDescargue ;
  final TextEditingController horaECargue ;
  final TextEditingController horaEDescargue;

  final Function callback;

  @override
  State<FleteForm> createState() => _FleteFormState();
}

class _FleteFormState extends State<FleteForm> {
  String? conf;
  String? origenVal;
  String? destinoVal;
  String? carga;
  String? tipoTrans;

  @override
  Widget build(BuildContext context) {
    print(conf);
    


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

                      // SelectInput(list: origen, value: conf, label: '¿Donde se origina el viaje?',),
                      select(list: origen, selectType: "origenVal", label: '¿Donde se origina el viaje?',),
                      SizedBox(height: height*0.025,),
                      select(list: destino, selectType: "destinoVal", label: '¿Cual es el destino?',),
                      // SelectInput(list: destino, value: destinoVal, label: '¿Cual es el destino?',),
                      SizedBox(height: height*0.025,),
                      select(list: confVehiculo, selectType: "conf", label: '¿Cuál es la configuración de su vehículo?',),
                      // SelectInput(list: confVehiculo, value: origenVal, label: '¿Cuál es la configuración de su vehículo?',),
                      SizedBox(height: height*0.025,),
                      select(list: tipoCarga, selectType: "carga", label: '¿Qué tipo de carga va a transportar?',),
                      // SelectInput(list: tipoCarga, value: carga, label: '¿Qué tipo de carga va a transportar?',),
                      SizedBox(height: height*0.025,),
                      select(list: tipoTransporte, selectType: "tipoTrans", label: '¿Qué tipo de unidad de transporte va a emplear?',),
                      // SelectInput(list: tipoTransporte, value: tipoTrans, label: '¿Qué tipo de unidad de transporte va a emplear??',),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Input(controller: widget.horaCargue, inputText: "¿Horas para el cargue?", width: width*0.42, numbers: true,),
                          const Spacer(),
                          Input(controller: widget.horaDescargue, inputText: "¿Horas para el descargue?", width: width*0.42, numbers: true,),
                        ],
                      ),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Input(controller: widget.horaECargue, inputText: "¿Horas de espera en el cargue?", width: width*0.42, numbers: true,),
                          const Spacer(),
                          Input(controller: widget.horaEDescargue, inputText: "¿Horas de espera en el descargue?", width: width*0.42, numbers: true,),
                        ],
                      ),
                      SizedBox(height: height*0.025,),

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
                                // widget.callback(origenVal, destinoVal,);
                              }, 
                              child: Text("Calcular flete", style: GoogleFonts.rubik(color: Colors.white, fontSize: 18, fontWeight:    FontWeight.w500 ),
                              )
                            ),
                          ),
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

  Column select({required String label, required List<String> list, required String? selectType}){
    // log("btnVlue:$btnValue");
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            label, 
            style: GoogleFonts.rubik(fontSize: 18),
            textAlign: TextAlign.left,
          )
        ),
        const SizedBox(height:  10,),
        DropdownButtonFormField<String>(
          // value: btnValue,
          isExpanded: true,
          isDense: false,
          decoration: const InputDecoration(
            focusColor: Colors.amber,
            hoverColor: Colors.red,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)
          ),

          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          items:list.map((value){
            // log(value);
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: GoogleFonts.rubik(color: Colors.black87),) 
            );
          }).toList(), 
          onChanged: (String? value){
            if(selectType == "conf"){
              conf = value!;
            }else if(selectType == "origenVal"){
              origenVal = value!;
            }else if(selectType == "destinoVal"){
              destinoVal = value!;
            }else if(selectType == "carga"){
              carga = value!;
            }else if(selectType == "tipoTrans"){
              tipoTrans = value!;
            }
          }
        ),
      ],
    );
  }
}