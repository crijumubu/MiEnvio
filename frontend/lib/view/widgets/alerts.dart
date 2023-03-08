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
    QuickAlert.show(
      context: context, 
      type: QuickAlertType.custom,
      barrierDismissible: true,
      confirmBtnText: "Acepto",
      confirmBtnColor: Color(0xff588157),
      cancelBtnText: "No acepto",
      showCancelBtn: true,
      onConfirmBtnTap: () {
        Navigator.pushNamed(context, "/initial_page");
      },
      widget: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Column(
        children:  [
           Text("Politicas de privacidad: ", style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.w700), ),
           const SizedBox(height: 10,),
           Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper eleifend iaculis. Curabitur id enim risus. Quisque ultricies lectus et posuere tincidunt. Integer sit amet tincidunt magna. Duis magna massa, facilisis quis nulla quis, iaculis vestibulum est. Nam maximus lobortis tellus, eget imperdiet felis eleifend nec. Fusce sit amet purus facilisis turpis egestas aliquam sit amet id risus. Aenean sit amet sem ut est sodales placerat. Morbi nec pharetra ex.

Mauris auctor, augue eu ornare pretium, massa orci ultricies eros, id sollicitudin lectus enim eget ex. Fusce tempor arcu enim, in lobortis ante semper sed. Etiam vestibulum finibus convallis. Sed sit amet dui eget massa pharetra bibendum. Ut sagittis, risus ac ultrices dapibus, diam mi vehicula nibh, vitae luctus dolor augue quis leo. Mauris nec euismod augue. Etiam mattis porttitor libero at lacinia. Ut tincidunt dapibus tellus, non venenatis erat sollicitudin ut. Quisque mattis velit sapien, a ullamcorper elit gravida nec. ''', textAlign: TextAlign.justify, style: GoogleFonts.rubik(),),
        ],
      )
    ));
  }