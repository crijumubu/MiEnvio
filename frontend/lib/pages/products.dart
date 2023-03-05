import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Productos", style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w700),));
  }
}