import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class RoutingButton extends StatelessWidget {

  final String text;
  final String route;
  final dynamic callback;
  final ButtonStyle? btnStyle;

  final TextStyle  _routingBtnStyle = const TextStyle( //* Estilo del texto
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  
  const RoutingButton({super.key, required this.text, required this.route,  this.btnStyle, this.callback,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: (btnStyle ?? ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 15)
      )),
      onPressed: (){

        if(callback!= null){
          callback();
        }
        
        Navigator.pushNamed(context, route);

      }, 
      
      child: Text(text, style: btnStyle == null ? _routingBtnStyle : (const TextStyle( color: Colors.black, decoration: TextDecoration.underline)) ,)
      );
  }
}

