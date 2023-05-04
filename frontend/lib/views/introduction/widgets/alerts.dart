import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

void succesfulAlert(context, text){
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: "Completado!",
    text: text,
    autoCloseDuration: const Duration(seconds:1, milliseconds: 500),
    confirmBtnColor: const Color(0xff588157),
    onConfirmBtnTap: (){
      
    }
  );
}


void errorAlert(context, time,  text){
  
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: "Error!",
    text: text,
    autoCloseDuration: Duration(seconds:time),
    confirmBtnColor: const Color(0xff588157),

    onConfirmBtnTap: (){},
  
    
  );
}
Future savePoliciy() async{
  SharedPreferences shPref = await SharedPreferences.getInstance();

  await shPref.setBool("policy", true);
}

void modalWindow(context){
  bool isChecked = false;
  showModalBottomSheet<dynamic>(
    context: context, 
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (BuildContext context) {
      return  StatefulBuilder(builder: 
      (BuildContext context, StateSetter setState){
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo200.png"),
              opacity: 0.09,
              scale: 0.7            // colorFilter: ColorFilter.mode(Colors.green, BlendMode. colorDodge  )
            ),

          ),
          height: MediaQuery.of(context).size.height * 0.88,
          child: SingleChildScrollView(

            padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 40),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Politicas de privacidad: ", style: GoogleFonts.rubik(fontSize: 30, fontWeight:  FontWeight.w700), ),
                const SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "En nuestra aplicación móvil de cálculo de fletes y control de envíos, valoramos la privacidad y la seguridad de tus datos personales. Por lo tanto, hemos desarrollado una política de tratamiento de datos que se aplica a todos los usuarios de la aplicación.\n"),
                      TextSpan(text: "\nRecopilación y uso de datos:\n", style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 17)),
                      TextSpan(text: "\t • Al registrarte en nuestra aplicación, recopilamos tu información personal, como tu nombre completo, correo electrónico, dirección y número de teléfono. Esta información se utiliza para identificarte y comunicarnos contigo sobre tus entregas y cualquier otra información relevante.\n"),
                      TextSpan(text: "\t • Los supervisores son los únicos usuarios que pueden registrar envíos, calcular fletes y hacer seguimiento en tiempo real de los conductores. Para esto, se les solicita información adicional, como las direcciones de recogida y entrega, información de contacto del remitente y destinatario, información del producto y el costo del flete. Esta información es necesaria para proporcionar un servicio eficiente y organizado.\n"),
                      TextSpan(text: "\t • Los conductores pueden acceder a información detallada sobre las entregas que deben realizar, incluyendo la ubicación del cliente, las instrucciones de entrega y las fechas de entrega previstas. También pueden registrar información importante sobre el estado de las entregas, como la hora de entrega y el estado del producto.\n"),
                      TextSpan(text: "\nProtección y almacenamiento de datos:\n", style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 17)),
                      TextSpan(text: "\t • En ningún caso compartimos tu información personal con terceros sin tu consentimiento previo.\n"),
                      TextSpan(text: "\t • Los supervisores pueden compartir información sobre entregas con otros miembros de su equipo, con el fin de garantizar un servicio de entrega eficiente y organizado.\n"),
                      TextSpan(text: "\nDerechos de acceso y eliminación de datos:\n", style: GoogleFonts.rubik(fontWeight: FontWeight.w600, fontSize: 17)),
                      TextSpan(text: "\t • Como usuario de nuestra aplicación, tienes derecho a acceder, corregir o eliminar cualquier información personal que hayamos recopilado sobre ti. Para hacerlo, comunícate con nuestro equipo de soporte.\n"),
                      TextSpan(text: "\t • Si deseas eliminar tu cuenta en nuestra aplicación, puedes hacerlo en cualquier momento. Al hacerlo, se eliminarán todos tus datos personales de nuestra base de datos.\n\n"),
                      TextSpan(text: "Si tienes alguna pregunta o inquietud sobre nuestra política de tratamiento de datos, no dudes en contactarnos al correo mienvio@soporte.com. Estamos comprometidos con la protección de tus datos personales y te proporcionaremos la información y la ayuda que necesites.\n"),
                    ],
                    // textAlign: TextAlign.justify, 
                    style: GoogleFonts.rubik(fontSize: 15, color: Colors.black),
                  ),
                  textAlign: TextAlign.justify,
                ),
                // Text('''''', textAlign: TextAlign.justify, style: GoogleFonts.rubik(fontSize: 15),),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                  title: const Text("Acepto que mi informacion sera usada conforme las politicas de privacidad de MiEnvio", style: TextStyle(fontSize: 14, decoration: TextDecoration.underline, fontWeight: FontWeight.w700), textAlign: TextAlign.left,),
                  leading: Checkbox(
                    checkColor: Colors.white,
                    
                    value: isChecked,
                    onChanged: (bool? value){
                      setState((){
                        isChecked = value!;
                      });
                    },
                  ),
                  onTap: () {
                    setState((){
                      isChecked = !isChecked;
                    });
                  },

                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: (isChecked ? 130:120),
                  
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: (isChecked ? Colors.green[900]: Colors.grey[700]), backgroundColor:  (isChecked ? Colors.green[100]: Colors.grey[300])),
                    onPressed: ()  {
                      if(isChecked){
                        savePoliciy();
                        
                        Navigator.pushNamed(context, "/initial-page");
                      }
                    }, 
                    child: Text("Aceptar", style: TextStyle(fontWeight: FontWeight.w700, fontSize:  (isChecked ? 16:13)),)
                  ),
                ),
              ],
            ),
          ),
       );
      }
    );
      
      
    }
  );
}