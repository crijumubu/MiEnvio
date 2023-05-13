import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("assets/images/logo200.png"),
      color: Colors.white.withOpacity(0.5),
      colorBlendMode: BlendMode.modulate,
      height: 100
    );
  }
}