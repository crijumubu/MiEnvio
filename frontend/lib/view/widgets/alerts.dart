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


void errorAlert(context, text){
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: "Error!",
    text: text,
    autoCloseDuration: const Duration(seconds:1),
    confirmBtnColor: const Color(0xff588157),

    onConfirmBtnTap: (){},
  
    
  );
}

