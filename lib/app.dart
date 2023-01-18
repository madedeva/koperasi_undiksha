import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:praktikum_satu/component/bottom_bar.dart';
import 'package:praktikum_satu/model/user_references.dart';
import 'package:praktikum_satu/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component/beranda.dart';
import 'component/horizontal_layout.dart';
import 'component/navbar_beranda.dart';
import 'component/contact.dart';
import 'model/user.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String _scanBarcode = 'Unknown';
  final _formKey = GlobalKey<FormState>();

  UserReferences userReferences = UserReferences();
  UserServices userServices = UserServices();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _services = UserServices();

  String? userId;

  List<UserModel?> _mod = [null];

  void awaiting() async {
    await userReferences.getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });
  }

  void datas(userId) async {
    if (_mod[0] == null) {
      _mod = await userServices.getUser(userId: userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // cek jika terdapat data login
    userReferences.getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });

    if (userId != null && userId != '') {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Koperasi Undiksha'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  userId = null;
                  _mod = [null];
                  userReferences.setNullAllData();
                });
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: FutureBuilder(
          builder: ((context, snapshot) {
            datas(userId);

            if (_mod[0] != null) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: BerandaDesktop(myUser: _mod[0]),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            const Contact()
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: Beranda(myUser: _mod[0]),
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
        bottomNavigationBar: const BottomBarBeranda(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          onPressed: () => scanQR(),
          tooltip: 'Transfer',
          child: const FaIcon(
            FontAwesomeIcons.qrcode,
            size: 36,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    } else {
      // jika tidak ada, maka arahkan ke halaman login
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Koperasi Undiksha'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png', width: 150),
                  const SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(3, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            // Login menggunakan services

                            await _services
                                .loginUser(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            )
                                .then((value) {
                              if (value != [null]) {
                                setState(() {
                                  userReferences.setUserId(value[0]!.userId);
                                  userId = value[0]!.userId;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Username atau Password salah'),
                                  ),
                                );
                              }
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Username atau Password salah'),
                                ),
                              );
                            });
                          },
                          child: const SizedBox(
                            width: 100,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text('Daftar Mbanking'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(' Lupa password?'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      );
    }
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;

      Navigator.pushNamed(context, '/transfer', arguments: _scanBarcode);

      final Uri url = Uri.parse(_scanBarcode);
      _launchUrl(url);
    });
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
