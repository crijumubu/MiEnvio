import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/controller/map_controller.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:frontend/views/shippings_driver/shippings_driver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShippingDetailed extends StatefulWidget {
  const ShippingDetailed({super.key, required this.initialPos, required this.envio});
  final LatLng initialPos;
  final Shipping envio;

  @override
  State<ShippingDetailed> createState() => _ShippingDetailedState();
}

class _ShippingDetailedState extends State<ShippingDetailed> {
  final Completer<GoogleMapController> _controllerMap = Completer<GoogleMapController>();
  late MapController _controller = MapController(initialPos: widget.initialPos, controller: _controllerMap);

      

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: headerBack(context),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _controller.cameraPosition(),
            markers: _controller.markers,
            onMapCreated: _controller.onMapCreated,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),
          ShippmentInfo(height: height, envio: widget.envio,),
          Positioned(
            right: 10,
            top: height *0.53,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff344E41),
                shape: CircleBorder(),
                padding: EdgeInsets.all(8)
              ),
              onPressed: (){
                _controller.backToInitial();
              }, 
              child: Icon(Icons.location_searching_rounded,color: Colors.white, size: 30,)
            ),
          )
        ],
      ),
    );
  }
}

class ShippmentInfo extends StatelessWidget {
  const ShippmentInfo({
    super.key,
    required this.height, required this.envio,
  });
  final Shipping envio;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15, right:15, bottom: 35),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: height*0.25,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 248, 248),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 15
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(envio.nombre, style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w600, color: Color(0xff344E41)),),
                      ],
                    ),
                    const Divider(color: Colors.grey,),
                    // SizedBox(height: 5,),
                    Row(
                      children: [
                        TextInfo(icon: Icons.arrow_circle_left_rounded, info: envio.origen, title: 'Origen: ',),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        TextInfo(icon: Icons.arrow_circle_right_rounded, info: envio.destino, title: 'Destino: ',),
                      ],
                    ),
                    SizedBox(height: 5,),
                    TextInfo(icon: Icons.location_pin, info: envio.direccion, title: 'Dirección: ',),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({
    super.key,
    required this.info, required this.title, required this.icon,
  });

  final String info;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, size: 18,color: Color(0xff344E41),)
          ),
          TextSpan(
            text: title,
            style: GoogleFonts.rubik(color: Color(0xff344E41), fontWeight: FontWeight.w500, fontSize: 18)
          ),
          TextSpan(
            text: info
          )
        ],
        style: GoogleFonts.rubik(fontSize: 16, color: Color.fromARGB(221, 22, 22, 22))
      )
    );
  }
}