import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.controller, required this.inputText});
  final TextEditingController controller;
  final String inputText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(inputText,
          style: GoogleFonts.rubik(),
        ),
        TextFormField()
      ],
    );
  }
}