import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Logo extends StatelessWidget {
  final double opacity;
  final String size;
  const Logo({super.key, required this.opacity, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/logo$size.png"),
      color: Colors.white.withOpacity(opacity),
      colorBlendMode: BlendMode.modulate,
    );
  }
}