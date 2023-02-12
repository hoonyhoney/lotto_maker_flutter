import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../main.dart';


class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample>{

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       children: [
         Expanded(
           flex: 5,
           child: QRView(
             key:qrKey,
             onQRViewCreated: _onQRViewCreated,
           ),
         )
       ],
     ),
   );
  }
  

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      Get.to(MyApp(),arguments: result);
    });
  }
  @override
  void  dispose(){
    controller?.dispose();
    super.dispose();
  }
}