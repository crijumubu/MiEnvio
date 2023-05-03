import 'package:flutter/material.dart';
import 'package:frontend/views/home/home.dart';
import 'package:frontend/views/user/user.dart';

class NavigatorSettings extends StatelessWidget {
  const NavigatorSettings({super.key, required this.user, required this.updateUser});
  final Usuario user;
  final Function updateUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: User(hasAppbar: false, name: user.name, email: user.email, password: user.password, id: user.id, updateUser: updateUser,),
    );
  }
}