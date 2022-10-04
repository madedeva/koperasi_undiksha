import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_satu/login_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //no shading
        backgroundColor: const Color.fromARGB(255, 33, 54, 243), //appbar color
        title: const Text('Koperasi Undiksha'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (context) => const Login()),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Image(
                        image: AssetImage('images/pp.jpeg'),
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color:
                                    const Color.fromARGB(255, 206, 191, 238)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nasabah',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Deva Kerti Wijaya'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          Color.fromARGB(255, 206, 191, 238)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Total Saldo Anda',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 10, 7, 139),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 33, 54, 243)),
                              label: const Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 33, 54, 243)),
                              label: const Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 33, 54, 243)),
                              label: const Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 33, 54, 243)),
                              label: const Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 33, 54, 243)),
                              label: const Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
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
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 33, 54, 243)),
                              label: const Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
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
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: const Text('Butuh bantuan?'),
                            ),
                            Container(
                              child: const Text(
                                '081529974101',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.call,
                          color: Color.fromARGB(255, 33, 54, 243),
                          size: 50,
                        ),
                      )
                    ]),
              )
            ],
          ),
        )),
      ),
      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 212, 216, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Menu',
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
