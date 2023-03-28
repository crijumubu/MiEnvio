import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double opacity;
  final double size;
  const Logo({super.key, required this.opacity, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo200.png",
      color: Colors.white.withOpacity(opacity),
      colorBlendMode: BlendMode.modulate,
      height: 300,
      width: 300,
    );
  }
}