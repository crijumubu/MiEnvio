import 'package:flutter/material.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({super.key, required this.list, required this.value});
  final List<String> list;
  final String value;

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
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: const InputDecoration(
        
      ),
      icon: const Icon(Icons.arrow_drop_down),
      items:widget.list.map((value){
        return DropdownMenuItem(
          value: value,
          child: Text(value) 
        );
      }).toList(), 
      onChanged: (String? value){
        setState(() {
          btnValue = value!;
        });
      }
    );
  }
}