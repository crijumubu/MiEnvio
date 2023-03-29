import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


AppBar headerBack (context){
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {Navigator.pop(context);},
      padding: const EdgeInsets.only(left:10),
    ),
  );
}
// class HeaderBack extends StatelessWidget {
//   const HeaderBack({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back_ios),
//         onPressed: () {Navigator.pop(context);},
//         padding: const EdgeInsets.only(left:10),
//       ),
//     );
//   }
// }