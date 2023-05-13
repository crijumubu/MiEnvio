import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {

  final TextEditingController? fieldController;
  final String placeholder;
  final String inputType;
  final int? maxLength;
  // final String? warning;
  final TextEditingController ?checkPasswords;
  // final String? warningController;

  const TextInput({super.key, this.fieldController, required this.placeholder,  this.checkPasswords, required this.inputType, this.maxLength});

  @override
  Widget build(BuildContext context) {
    

    bool hide = (inputType == "password" ||inputType ==  "passwordChecker") ? true : false;
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[

      // const SizedBox(height: 5,),

      TextFormField(
        controller: fieldController,                
        obscureText: hide,
        maxLength: maxLength,
        // readOnly: inputType == "warning" ? true : false,
        // enabled: inputType == "warning" ? false : true,        
        // scrollPadding: (maxLength == null)? EdgeInsets.only(bottom: 22) : EdgeInsets.all(0) ,
        
        style: const TextStyle(
          fontSize: 20,
        ),
        cursorHeight: 26,
        cursorColor: const Color(0xff344E41),

        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          contentPadding:  const EdgeInsets.symmetric(vertical:10, horizontal: 10),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff344E41), strokeAlign: 20, width: 2.5)  ),
          labelStyle: GoogleFonts.rubik(fontSize: 22, color: const Color(0xff3A5A40), fontWeight: FontWeight.w400),
          floatingLabelStyle: GoogleFonts.rubik(color: const Color(0xcc3A5A40), fontWeight: FontWeight.w500),
          border: null,
          label: Text(placeholder),
          
          
           
        ),
        
        
        validator: (value) {
          // print("$placeholder:$value");
          if(value==null || value.isEmpty){
            // print(value);
            // print(value!.isEmpty);
            return "Campo obligatorio";

          }

          switch (inputType) {
            case 'text':
              if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                return "Por favor ingresar unicamente caracteres de texto.";
              }
              break;

            case 'number':
              if(!RegExp(r'^[0-9]+$').hasMatch(value)){
                return "Por favor ingresar unicamente caracteres numericos.";
              }
              break;

            case 'email':
              if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
                return "Por favor ingresar un correo valido.";
              }
              break;

            case 'passwordChecker':
              if(checkPasswords!=null && checkPasswords!.text != value){
               return "Las contraseñas no coinciden";
              }
              break;

            default:
              return null;
          }
          
          return null;
          
          
        },      
      ),
      if(maxLength == null)
        const SizedBox(height: 22,)
    ]
  );
    
  }
}