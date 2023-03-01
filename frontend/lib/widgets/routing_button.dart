import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoutingButton extends StatelessWidget {

  final String text;
  final String route;
  final dynamic callback;
  const RoutingButton({super.key, required this.text, required this.route, this.callback});

  final TextStyle  _routingBtnStyle = const TextStyle( //* Estilo del texto
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, route);
      }, 
      child: Text(text, style: _routingBtnStyle,)
      );
  }
}

