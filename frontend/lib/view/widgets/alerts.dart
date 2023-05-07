import 'dart:ui';
import 'package:flutter/material.dart';
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

