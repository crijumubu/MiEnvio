import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

void succesfulAlert(context, text){
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: "Completado!",
    text: text,
    autoCloseDuration: const Duration(seconds:2 ),
    confirmBtnColor: const Color(0xff588157)
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


void modalWindow(context){
  showModalBottomSheet<dynamic>(
    context: context, 
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (BuildContext context) {
      return  SizedBox(
        height: MediaQuery.of(context).size.height * 0.88,
        child: SingleChildScrollView(
          
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 10),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Politicas de privacidad: ", style: GoogleFonts.rubik(fontSize: 30, fontWeight: FontWeight.w700), ),
              const SizedBox(height: 10,),
              Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.\nMauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.\nMauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.\nMauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec.
              ''', textAlign: TextAlign.justify, style: GoogleFonts.rubik(fontSize: 16),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(side: const BorderSide(color: Color(0xff057d01), width: 2), backgroundColor: const Color(0x1a057d01)),
                      onPressed: (){
                        Navigator.pushNamed(context, "/initial_page");
                      }, 
                      child: const Text("Aceptar", style: TextStyle(color: Color(0xff057d01), fontWeight: FontWeight.w700, fontSize: 15),)
                    ),
                  ),
                  const SizedBox(width: 10,),
                  // const SizedBox(height: 10,),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(side: const BorderSide(color: Color(0xff7d0101), width: 2), backgroundColor: const Color(0x1a7d0101)),
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: const Text("Rechazar", style: TextStyle(color: Color(0xff7d0101), fontWeight: FontWeight.w700, fontSize: 15),)
                    ),
                  )
                ],
              )
              
            ],
          ),
        ),
      );
    }
  );
//     QuickAlert.show(
//       context: context, 
//       type: QuickAlertType.custom,
//       barrierDismissible: true,
//       confirmBtnText: "Acepto",
//       confirmBtnColor: Color(0xff588157),
//       cancelBtnText: "No acepto",
//       showCancelBtn: true,
//       onConfirmBtnTap: () {
//         Navigator.pushNamed(context, "/initial_page");
//       },
//       widget: SingleChildScrollView(
        
//         scrollDirection: Axis.vertical,
//         child: Column(
//         children:  [
//           Text("Politicas de privacidad: ", style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.w700), ),
//           const SizedBox(height: 10,),
//           Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.

// Mauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec. ''', textAlign: TextAlign.justify, style: GoogleFonts.rubik(),),
//         ],
//       )
//     ));
  }