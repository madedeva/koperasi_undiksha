import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:praktikum_satu/views/beranda.dart';
import 'package:praktikum_satu/views/bottom_nav_beranda.dart';
import 'package:praktikum_satu/views/contact.dart';
import 'package:praktikum_satu/views/scan_qr.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  // String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Beranda'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Contact(),
                )
              ],
            );
          } else {
            return const Center(child: BerandaWidget());
          }
        },
      ),
      bottomNavigationBar: const BottomBarWidgetBeranda(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Qrscanner()),
            );
          },
          tooltip: 'Transfer',
          child: const FaIcon(
            FontAwesomeIcons.qrcode,
            size: 36,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Future<void> scanQR() async {
  //   String barcodeScanRes;
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }
}
