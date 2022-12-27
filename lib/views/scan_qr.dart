import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Qrscanner extends StatefulWidget {
  const Qrscanner({Key? key}) : super(key: key);

  @override
  State<Qrscanner> createState() => _QrscannerState();
}

class _QrscannerState extends State<Qrscanner> {
  String link = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Rekening tujuan:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text('$link'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                          "#ff6666", "Tutup", false, ScanMode.DEFAULT);
                  setState(() {
                    link = barcodeScanRes;
                  });
                },
                child: const Text(
                  'Scan QR',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            (link != '' && link != '-1')
                ? (link.contains('https://') || link.contains('http://'))
                    ? ElevatedButton(
                        onPressed: () {
                          _launchURL(link);
                          print('ini link: ' + link);
                        },
                        child: const Text(
                          'Transfer',
                          style: TextStyle(fontSize: 40),
                        ),
                      )
                    : const Text('Rekening tidak valid')
                : const Text('Rekening kosong')
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw "Transfer gagal";
    }
  }
}
