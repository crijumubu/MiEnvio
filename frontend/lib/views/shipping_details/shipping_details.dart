import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/flete/flete.dart';
import 'package:frontend/views/flete/widgets/data_row_info.dart';
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

  void getConductorName(){
    _authController.getUserData(widget.envios.idConductor).then((value){
      setState(() {
        print(value);
        conductor = value!.name;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getConductorName();
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
            toneladaMovilizacion: "", 
            costoToneladaMovilizacion: "", 
            costoMovilizacionCarga: "", 
            costoHoraAdicional: "", 
            horasDeEspera: "", 
            costoTiemposEspera: "", 
            toneladaKMViaje: "", 
            costoToneladaViaje: "", 
            costoTotalViaje: "", 
            costoKmMovilizacion: "", 
            costoKmViaje: ""
          )
        ],
      ),
    );
  }
}