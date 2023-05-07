import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../controller/auth_controller.dart';

class ScanQR extends StatefulWidget {
  ScanQR({super.key, required this.idEnvio, required this.idUser, required this.estado});
  final int idEnvio;
  final int idUser;
  final int estado;

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  // late double width;
  final AuthController _authController = AuthController();
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
              startDelay: true,
              // fit: BoxFit.contain,
              controller: cameraController,
              onDetect: (capture) {
                cameraController.stop();
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                print("Barcodes: ${barcodes[0].rawValue}");
                print(widget.estado);
                if(widget.idUser == 0) return;
                if(widget.estado == 2){
                  _authController.updateStatus(idViaje: widget.idEnvio, estado: 3, context: context).then((value){
                    Navigator.pushNamedAndRemoveUntil(context, "/home-supervisor", (route) => false, arguments: widget.idUser);
                  });
                }else{
                  _authController.setDriver(context, widget.idEnvio, int.parse(barcodes[0].rawValue!)).then(
                    (value){
                      if(value){                    
                        Navigator.pushNamedAndRemoveUntil(context, "/home-supervisor", (route) => false, arguments: widget.idUser);
                      }
                    }
                  );
                } 
                
              },
              // scanWindow: ,
            ),
          ],
        ),
    );
  }
}