import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

String _scanBarcode = _scanBarcode;

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        elevation: 0, //no shading
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 33, 54, 243),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                '#ff6666', 'Cancel', true, ScanMode.BARCODE);
            setState(() {
              _scanBarcode = barcodeScanRes;
            });
          },
          child: const Text(
            'Scan QR Code',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
