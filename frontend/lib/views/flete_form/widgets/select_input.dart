import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({super.key, required this.list, required this.value, required this.label});
  final List<String> list;
  final String value;
  final String label;

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  String btnValue = "";
  double width = 0;

  @override
  void initState() {
    btnValue = widget.value;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.label, 
            style: GoogleFonts.rubik(fontSize: 18),
            textAlign: TextAlign.left,
          )
        ),
        const SizedBox(height:  10,),
        DropdownButtonFormField(
          isExpanded: true,
          isDense: false,
          decoration: const InputDecoration(
            focusColor: Colors.amber,
            hoverColor: Colors.red,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)
          ),

          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          items:widget.list.map((value){
            return DropdownMenuItem(
              value: value,
              child: Text(value, style: GoogleFonts.rubik(color: Colors.black87),) 
            );
          }).toList(), 
          onChanged: (String? value){
            setState(() {
              btnValue = value!;
            });
          }
        ),
      ],
    );
  }
}