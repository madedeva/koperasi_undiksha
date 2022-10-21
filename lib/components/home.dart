import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_satu/components/dashboard_grid.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS
        //iOS Area
        ? const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Koperasi Undiksha'),
            ),
            child: CustomScrollView())
        //Android Area
        : Scaffold(
            appBar: AppBar(
              elevation: 0, //no shading
              backgroundColor:
                  const Color.fromARGB(255, 33, 54, 243), //appbar color
              title: const Text('Koperasi Undiksha'),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Icon(
                        Icons.logout,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 10, 7, 139),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            margin: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Image(
                                image: AssetImage('images/pp.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color.fromARGB(
                                          255, 206, 191, 238)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Nasabah',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Deva Kerti Wijaya'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width: 200,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: const Color.fromARGB(
                                                255, 206, 191, 238)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text('Total Saldo Anda',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('Rp. 1.000.000'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 10, 7, 139),
                        ),
                      ),
                      child: GridDashboard(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text('Butuh bantuan?'),
                                Text(
                                  '081529974101',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.0,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.call,
                              color: Color.fromARGB(255, 33, 54, 243),
                              size: 50,
                            )
                          ]),
                    )
                  ],
                ),
              )),
            ),
            //bottom navigation bar
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 212, 216, 255),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code,
                    size: 50,
                  ),
                  label: 'QRIS',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Color.fromARGB(255, 33, 54, 243),
              unselectedItemColor: Color.fromARGB(255, 33, 54, 243),
              showUnselectedLabels: true,
            ),
          );
  }
}
