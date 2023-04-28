import 'package:flutter/material.dart';
import 'package:frontend/views/register/widgets/header_back.dart';
import 'package:google_fonts/google_fonts.dart';

class User extends StatefulWidget {
  User({super.key, required this.hasAppbar, required this.name, required this.email, required this.password});
  final bool hasAppbar;
  final String name;
  final String email;
  final String password;

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _passwordConf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    // _username.;

    return (widget.hasAppbar) ?  Scaffold(
      appBar: headerBack(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Icon(Icons.user)
            // Text("Usuario", style: GoogleFonts.rubik(fontSize: 32),)
            const SizedBox(height: 30,),
            CircleAvatar(
              // minRadius: 50,
              // maxRadius: 100,
              backgroundColor: Colors.black,
              radius: 80,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Color(0xffDAD7CD),
                backgroundImage: AssetImage("assets/images/profile.png",)
              )
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: Text("Datos almacenados:", style: GoogleFonts.rubik(fontSize: 26, fontWeight: FontWeight.w600),)
            ),
            const SizedBox(height: 15,),
            Field(placeholder: "Usuario:", value: widget.name, controller: _username),
            const SizedBox(height: 10,),
            Field(placeholder: "Email:", value: widget.email, controller: _email),
            const SizedBox(height: 10,),
            Field(placeholder: "Contraseña:", value: "•••••••••••", controller: _password, hiden: true),
            Visibility(
              visible: false,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Field(placeholder: "Confirmar Contraseña:", controller: _passwordConf),
                ],
              )
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){

              }, 
              child: Text("Actualizar datos", style: GoogleFonts.rubik(fontSize: 20),)
            )
            // Field(placeholder: "Usuario:", value: "usuario", controller: _username),
          ],
        ),
      ),
    ):
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Icon(Icons.user)
            // Text("Usuario", style: GoogleFonts.rubik(fontSize: 32),)
            const SizedBox(height: 30,),
            CircleAvatar(
              // minRadius: 50,
              // maxRadius: 100,
              backgroundColor: Colors.black,
              radius: 80,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Color(0xffDAD7CD),
                backgroundImage: AssetImage("assets/images/profile.png",)
              )
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: Text("Datos almacenados:", style: GoogleFonts.rubik(fontSize: 26, fontWeight: FontWeight.w600),)
            ),
            const SizedBox(height: 15,),
            Field(placeholder: "Usuario:", value: widget.name, controller: _username),
            const SizedBox(height: 10,),
            Field(placeholder: "Email:", value: widget.email, controller: _email),
            const SizedBox(height: 10,),
            Field(placeholder: "Contraseña:", value: "•••••••••••", controller: _password, hiden: true),
            Visibility(
              visible: false,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Field(placeholder: "Confirmar Contraseña:", controller: _passwordConf),
                ],
              )
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){

              }, 
              child: Text("Actualizar datos", style: GoogleFonts.rubik(fontSize: 20),)
            )
            // Field(placeholder: "Usuario:", value: "usuario", controller: _username),
          ],
        ),
      );
  }
}

class Field extends StatelessWidget {
  const Field({super.key, required this.placeholder, this.value, required this.controller, this.hiden});
  final String placeholder;
  final String? value;
  final bool? hiden;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(placeholder, style: GoogleFonts.rubik(fontSize: 15),),
        SizedBox(width: 10,),
        Flexible(
          child: TextField(
            obscureText: hiden ?? false,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              
              hintText: (value ?? "")
            ),
            readOnly: true,
            scrollPadding: EdgeInsets.all(0),
            controller: controller,
          ),
        )
      ],
    );
  }
}