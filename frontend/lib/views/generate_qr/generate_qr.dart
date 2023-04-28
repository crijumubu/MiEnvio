import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../register/widgets/header_back.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key, required this.hasAppbar, required this.title, required this.qrData});
  final bool hasAppbar;
  final String title;
  final double qrData;

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {

  @override
  Widget build(BuildContext context) {
    return (widget.hasAppbar) ? Scaffold(
      appBar: headerBack(context) ,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(child: Text(widget.title, style: GoogleFonts.rubik(fontSize: 34 ,fontWeight: FontWeight.bold),))
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  QrImage(
                    data: widget.qrData.toString(),
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Muestre este QR a un supervisor, para que se le asigne un viaje.", style: GoogleFonts.rubik(fontSize: 22), textAlign: TextAlign.justify,),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ) : 
    
    // ? Vista supervisor
    Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: Text(widget.title, style: GoogleFonts.rubik(fontSize: 32),)
              )
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  QrImage(
                    data: widget.qrData.toString(),
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                  Text("Muestre este QR a un supervisor, para que se le asigne un viaje", style: GoogleFonts.rubik(fontSize: 16),)
                ],
              ),
            )
          ],
        ),
      );
  }
}