import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataRowInfo extends StatelessWidget {
  const DataRowInfo({
    super.key, required this.title, required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(title, style: GoogleFonts.rubik(fontSize: 18),)
        ),
        const SizedBox(height: 5,),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 249, 233),
            border: Border.all(color: Color(0xff7b7b7b)),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: SizedBox(
              width: double.infinity,  
              child: Text(content, style: GoogleFonts.rubik(fontSize: 18),)
            ),
          ),
        )
      ],
    );
  }
}
