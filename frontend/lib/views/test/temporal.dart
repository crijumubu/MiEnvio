import 'package:flutter/material.dart';
import 'package:frontend/controller/auth_controller.dart';
import 'package:frontend/views/register/widgets/header_back.dart';

class Temporal extends StatelessWidget {
  Temporal({super.key, required this.idEnvio});
  final TextEditingController _id = TextEditingController();
  final int idEnvio;
  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    print(idEnvio);
    return Scaffold(
      appBar: headerBack(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/scan-qr");
              }, 
              child: Text("QR Scanner")
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller:  _id,
                decoration: InputDecoration(
                  hintText: "Id del conductor"
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                if(_id.text != ""){
                  _authController.setDriver(context, idEnvio, int.parse(_id.text));
                }
                // Navigator.pushNamed(context, "/scan-qr");
              }, 
              child: Text("Asignar")
            ),
          ],
        ),
      ),
    );
  }
}