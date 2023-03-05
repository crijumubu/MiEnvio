import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Favorites", style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w700),));
  }
}