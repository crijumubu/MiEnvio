import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Usuario", style: GoogleFonts.rubik(fontSize: 32, fontWeight: FontWeight.w700),));

  }
}