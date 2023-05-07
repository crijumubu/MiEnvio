import 'package:flutter/material.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shippings_driver/shippings_driver.dart';
import 'widgets/data_section.dart';
import 'widgets/data_field.dart';
import 'widgets/data_row_info.dart';

class Flete extends StatelessWidget {
  const Flete({super.key, required this.envio});
  final Shipping envio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBack(context),
      backgroundColor: Colors.grey[100],          
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          FleteContent(costoHoraAdicional: '', costoKmMovilizacion: '', costoKmViaje: '', costoMovilizacionCarga: '', costoTiemposEspera: '', costoToneladaMovilizacion: '', costoToneladaViaje: '', costoTotalViaje: '', horasDeEspera: '', toneladaKMViaje: '', toneladaMovilizacion: '',),
        
        ],
      )
    );
  }
}

class FleteContent extends StatelessWidget {
  const FleteContent({
    super.key, required this.toneladaMovilizacion, required this.costoToneladaMovilizacion, required this.costoMovilizacionCarga, required this.costoHoraAdicional, required this.horasDeEspera, required this.costoTiemposEspera, required this.toneladaKMViaje, required this.costoToneladaViaje, required this.costoTotalViaje, required this.costoKmMovilizacion, required this.costoKmViaje,
  });

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
                DataRowInfo(title: 'Tonelada x KM movilización:', content: '\$328.53', ),
                DataRowInfo(title: 'Costo tonelada movilización:', content: '\$131,345.54', ),
                DataRowInfo(title: 'Costo movilización carga:', content: '\$1,182,109.83', ),
              ],
            ),              
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Costo hora adicional:', content: '\$21.171', ),
                DataRowInfo(title: 'Horas de espera:', content: '10.0', ),
                DataRowInfo(title: 'Costo tiempos de espera:', content: '\$271,707.90', ),
              ],
            ),
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Tonelada x KM del viaje:', content: '\$404.04', ),
                DataRowInfo(title: 'Costo tonelada del viaje:', content: '\$161,535.30', ),
                DataRowInfo(title: 'Costo total del viaje:', content: '\$1,453,817.73', ),
              ],
            ),
            DataSection(
              dataRows: [
                DataRowInfo(title: 'Costo x KM movilización:', content: '\$2,956.75', ),
                DataRowInfo(title: 'Costo x KM del viaje:', content: '\$3,636.36', ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  backgroundColor: Color(0xff3344E41),
                  shadowColor:Color.fromRGBO(224, 224, 224, 1)
                ),
                onPressed:(){
                
                }, 
                child: Text("Descargar costos en detalle", style: GoogleFonts.rubik(fontSize: 20), textAlign: TextAlign.center,) 
              ),
            ),
          ],
        ),
        const SizedBox(height: 30,),

      ],
    );
  }
}