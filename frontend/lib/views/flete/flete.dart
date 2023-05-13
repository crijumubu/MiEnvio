import 'package:flutter/material.dart';
import 'package:frontend/views/flete_form/flete_form.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shippings_driver/shippings_driver.dart';
import 'widgets/data_section.dart';
import 'widgets/data_field.dart';
import 'widgets/data_row_info.dart';

class Flete extends StatelessWidget {
  const Flete({super.key, required this.envio, required this.userId});
  final Shipping envio;
  final int userId;
  // final FleteView flete;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {Navigator.pushNamed(context, "/home-supervisor", arguments: userId);},
          padding: const EdgeInsets.only(left:10),
        ),
      ),
      backgroundColor: Colors.grey[100],          
      body: WillPopScope(
        onWillPop: ()async => false,
        child: ListView(
          children: [
            const SizedBox(height: 30,),
            FleteContent(flete: flete1,),
          
          ],
        ),
      )
    );
  }
}

class FleteContent extends StatelessWidget {
  const FleteContent({
    super.key, required this.flete,
  });

  final FleteView flete;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Text("Flete", style: GoogleFonts.rubik(fontSize: 34, fontWeight: FontWeight.bold),)
          ),
        ),

        Divider(color: Colors.grey, thickness: 0.8,),

        const SizedBox(height: 5,),
        DataField(
          title: 'Resumen de costos operativos', 
          sections: [
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Tonelada x KM movilización:', content: flete.toneladaMovilizacion, ),
                DataRowInfo(title: 'Costo tonelada movilización:', content: flete.costoToneladaMovilizacion, ),
                DataRowInfo(title: 'Costo movilización carga:', content: flete.costoMovilizacionCarga, ),
              ],
            ),              
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Costo hora adicional:', content: flete.costoHoraAdicional, ),
                DataRowInfo(title: 'Horas de espera:', content: flete.horasDeEspera, ),
                DataRowInfo(title: 'Costo tiempos de espera:', content: flete.costoTiemposEspera, ),
              ],
            ),
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Tonelada x KM del viaje:', content: flete.toneladaKMViaje, ),
                DataRowInfo(title: 'Costo tonelada del viaje:', content: flete.costoToneladaViaje, ),
                DataRowInfo(title: 'Costo total del viaje:', content: flete.costoTotalViaje, ),
              ],
            ),
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Costo x KM movilización:', content: flete.costoKmMovilizacion, ),
                DataRowInfo(title: 'Costo x KM del viaje:', content: flete.costoKmViaje, ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20,),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       width: 220,
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //           backgroundColor: Color(0xff3344E41),
        //           shadowColor:Color.fromRGBO(224, 224, 224, 1)
        //         ),
        //         onPressed:(){
                
        //         }, 
        //         child: Text("Descargar costos en detalle", style: GoogleFonts.rubik(fontSize: 20), textAlign: TextAlign.center,) 
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 30,),

      ],
    );
  }
}


class FleteView{
  final String toneladaMovilizacion;
  final String costoToneladaMovilizacion;
  final String costoMovilizacionCarga;
  final String costoHoraAdicional;
  final String horasDeEspera;
  final String costoTiemposEspera;
  final String toneladaKMViaje;
  final String costoToneladaViaje;
  final String costoTotalViaje;
  final String costoKmMovilizacion;
  final String costoKmViaje;

  FleteView({required this.toneladaMovilizacion, required this.costoToneladaMovilizacion, required this.costoMovilizacionCarga, required this.costoHoraAdicional, required this.horasDeEspera, required this.costoTiemposEspera, required this.toneladaKMViaje, required this.costoToneladaViaje, required this.costoTotalViaje, required this.costoKmMovilizacion, required this.costoKmViaje});
}