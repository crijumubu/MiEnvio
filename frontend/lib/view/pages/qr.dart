import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController id = TextEditingController();
  Widget xd = Text("");
  String? data = "";

  void generar(String p) {
    setState(() {
      xd = QrImage(
        data: p,
        version: QrVersions.auto,
        size: 200.0,
      );
    });
  }

  void scan() async{
    String? cameraScanResult = await scanner.scan();
    setState(() {
      data = cameraScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
              controller: id,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingresa tu contraseña',
              )),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                generar(this.id.text);
              },
              child: Text(("Generar"))),
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () async {
                scan();
              },
              child: Text(("Escanear")),
            )),
        Padding(padding: EdgeInsets.all(20),child: xd,),
        Text(data.toString())
      ],
    ));
  }
}
