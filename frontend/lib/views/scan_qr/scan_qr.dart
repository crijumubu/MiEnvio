import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../register/widgets/header_back.dart';

class ScanQR extends StatelessWidget {
  const ScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBack(context),
      body: Center(
        child: Text("Escanear QR", style: GoogleFonts.rubik(fontSize: 64),),
      )
    );
  }
}