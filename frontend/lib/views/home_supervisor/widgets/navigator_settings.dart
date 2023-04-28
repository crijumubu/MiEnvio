import 'package:flutter/material.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/user/user.dart';

class NavigatorSettings extends StatelessWidget {
  const NavigatorSettings({super.key, required this.user});
  final Usuario user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: User(hasAppbar: false, name: user.name, email: user.email, password: user.password),
    );
  }
}