import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class FormField extends StatelessWidget {

  final TextEditingController fieldController;
  final String placeholder;
  const FormField({super.key, required this.fieldController, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      obscureText: true,
      
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        // hintText: 'Password',
        hintText: placeholder
      ),
      
    );
  }
}