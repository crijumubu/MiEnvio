import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/flete/flete.dart';
import 'package:frontend/views/flete/widgets/data_row_info.dart';
import 'package:frontend/views/flete_form/flete_form.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flete/widgets/data_field.dart';
import '../flete/widgets/data_section.dart';
import '../shippings_driver/shippings_driver.dart';

class ShippingDetails extends StatefulWidget {
  ShippingDetails({super.key, required this.envios});
  final Shipping envios;

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  final AuthController _authController = AuthController();
  String conductor = "";
  final FleteView flete = flete1;

  void getConductorName(){
    _authController.getUserData(widget.envios.idConductor).then((value){
      setState(() {
        print(value);
        conductor = value!.name;
      });
    });
  }

  void getFlete(){
    // _authController.getFlete(widget.envios.idViaje).then((value){
    //   setState(() {
    //     flete = FleteView(toneladaMovilizacion: value[0]["toneladaKilometro"].toString(), costoToneladaMovilizacion: value[0]["costoTonelada"].toString(), costoMovilizacionCarga: value[0]["costocarga"].toString(), costoHoraAdicional: value[0]["costoHoraadicional"].toString(), horasDeEspera: value[0]["horasEspera"].toString(), costoTiemposEspera: value[0]["costoTiempoEspera"].toString(), toneladaKMViaje: value[0]["toneladaKilometroViaje"].toString(), costoToneladaViaje: value[0]["toneladaViaje"].toString(), costoTotalViaje: (value[0]["costocarga"]*value[0]["costoTiempoEspera"]).toString(), costoKmMovilizacion: value[0]["costoKilometro"].toString(), costoKmViaje: value[0]["costoKilometro"].toString());
        
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();
    getConductorName();
    // getFlete();
  }

  @override
  Widget build(BuildContext context) {
    final String estado = (widget.envios.estado == 1) ?  "Pendiente" : (widget.envios.estado == 2 ? "Activo" : "Finalizado");

    return Scaffold(
      appBar: headerBack(context),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Text("Detalles del envio", style: GoogleFonts.rubik(fontSize: 34, fontWeight: FontWeight.bold),)
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
          DataField(
            title: "Información general", 
            sections: [
              DataSection(
                dataRows: [
                  DataRowInfo(title: "Nombre:", content: widget.envios.nombre),
                  DataRowInfo(title: "Estado:", content: estado),
                  DataRowInfo(title: "Origen:", content: widget.envios.origen),
                  DataRowInfo(title: "Destino:", content: widget.envios.destino),
                  DataRowInfo(title: "Dirección:", content: widget.envios.direccion),
                  DataRowInfo(title: "Conductor asignado:", content: conductor),
                ]
              )

            ]
          ),
          const SizedBox(height: 15),
          FleteContent(
            flete: flete,
          )
        ],
      ),
    );
  }
}