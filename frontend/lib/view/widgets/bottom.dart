import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image(
          image: const AssetImage("assets/images/logo200.png"),
          color: Colors.white.withOpacity(0.5),
          colorBlendMode: BlendMode.modulate,
          height: 100
        ),
      ],
    ));
  }
}