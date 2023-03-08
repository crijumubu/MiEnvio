import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class TextInput extends StatelessWidget {

  final TextEditingController fieldController;
  final String placeholder;
  final bool hide;
  final TextEditingController ?checkPasswords;
  const TextInput({super.key, required this.fieldController, required this.placeholder, required this.hide, this.checkPasswords});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      // Row(
      //   children: [
      //     Text(
      //       placeholder,
      //       style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      //       textAlign: TextAlign.left,
            
      //     ),
      //   ],
      // ),
      const SizedBox(height: 5,),

      TextFormField(
        controller: fieldController,                
        obscureText: hide,
        maxLength: hide == false ? 16 : 12,
        
        style: const TextStyle(
          fontSize: 20,
          // color: Color),
        ),
        cursorHeight: 26,
        cursorColor: const Color(0xff344E41),

        decoration: InputDecoration(
          // border:  OutlineInputBorder(),
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff344E41), strokeAlign: 20, width: 2.5)  ),
          labelStyle: GoogleFonts.rubik(fontSize: 22, color: Color(0xff3A5A40), fontWeight: FontWeight.w400),
          floatingLabelStyle: GoogleFonts.rubik(color: const Color(0xcc3A5A40), fontWeight: FontWeight.w500),
          label: Text(placeholder),
           
        ),
        
        
        validator: (value) {
          if(value == null || value.isEmpty){
            return "Campo obligatorio";
          }
          if(checkPasswords!=null && checkPasswords!.text != value){
            return "Las contraseñas no coinciden";
          }
          return null;
        },      
      )
    ]
  );
    
  }
}