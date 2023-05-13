import 'package:flutter/material.dart';


AppBar headerBack (context){
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {Navigator.pop(context);},
      padding: const EdgeInsets.only(left:10),
    ),
  );
}
