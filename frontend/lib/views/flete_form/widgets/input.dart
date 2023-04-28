import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.controller, required this.inputText, this.width, this.onChange});
  final TextEditingController controller;
  final String inputText;
  final double? width;
  final Function? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(inputText,
              style: GoogleFonts.rubik(fontSize: 18),
            ),
          ),
          const SizedBox(height:  10,),
          TextFormField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (value){
              onChange!(value);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)
            ),
          )
        ],
      ),
    );
  }
}