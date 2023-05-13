import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataField extends StatelessWidget {
  const DataField({
    super.key, required this.title, required this.sections,
  });

  final String title;
  final List<Widget> sections; 

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (var i = 0; i < sections.length; i++) {
      children.add(sections[i]);
      if(i != sections.length-1){
        children.add(const SizedBox(height: 15,));
      }
    }

    return Column(
      
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title, style: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w500),),
          ),
        ),
        const SizedBox(height: 10,),
        // Divider(color: Colors.grey, thickness: 0.8,),
        ...children
      ],
    );
  }
}