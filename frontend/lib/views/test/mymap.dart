import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../../controller/map_controller.dart';
import '../shippings_driver/shippings_driver.dart';

class MyMap extends StatefulWidget {
  final String userId;
  final Shipping envio;
  
  const MyMap(this.userId, {super.key, required this.envio});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;

  final AuthController _authController = AuthController();
  late String conductor = "";

  void getConductorName(){
    _authController.getUserData(widget.envio.idConductor).then((value){
      setState(() {
        conductor = value!.name;
      });
    });
  }

  @override
  void initState() {
    getConductorName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('location').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (_added) {
                      mymap(snapshot);
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return GoogleMap(
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      scrollGesturesEnabled: false,
                      markers: {
                        Marker(
                            position: LatLng(
                              snapshot.data!.docs.singleWhere(
                                  (element) => element.id == widget.userId)['latitude'],
                              snapshot.data!.docs.singleWhere(
                                  (element) => element.id == widget.userId)['longitude'],
                            ),
                            markerId: const MarkerId('id'),
                            ),
                      },
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            snapshot.data!.docs.singleWhere(
                                (element) => element.id == widget.userId)['latitude'],
                            snapshot.data!.docs.singleWhere(
                                (element) => element.id == widget.userId)['longitude'],
                          ),
                          zoom: 14.47),
                      onMapCreated: (GoogleMapController controller) async {
                        setState(() {
                          _controller = controller;
                          controller.setMapStyle(jsonEncode(mapStyle));
                          _added = true;
                        });
                      },
                    );
              },
            ),
            DriverInfo(height: height, conductor: conductor, destino: widget.envio.destino, direccion: widget.envio.direccion, origen: widget.envio.origen, nombre: widget.envio.nombre,)

          ],
        ));
  }

  Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.userId)['latitude'],
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.userId)['longitude'],
            ),
            zoom: 14.47)));
  }
}

class DriverInfo extends StatelessWidget {
  DriverInfo({
    super.key,
    required this.height, required this.conductor, required this.origen, required this.destino, required this.direccion, required this.nombre,
  });
  final double height;
  final String conductor;
  final String origen;
  final String destino;
  final String nombre;
  final String direccion;

  // final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15, right:15, bottom: 35),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: height*0.24,
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
                        Text(nombre, style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w600, color: Color(0xff344E41)),),
                      ],
                    ),
                    const Divider(color: Colors.grey,),
                    Row(
                      children: [
                        TextInfo(icon: Icons.person, info: conductor, title: 'Conductor: ',),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        TextInfo(icon: Icons.arrow_circle_left_rounded, info: origen, title: 'Origen: ',),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        TextInfo(icon: Icons.arrow_circle_right_rounded, info: destino, title: 'Destino: ',),
                      ],
                    ),
                    SizedBox(height: 5,),
                    TextInfo(icon: Icons.location_pin, info: direccion, title: 'Dirección: ',),
                    
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