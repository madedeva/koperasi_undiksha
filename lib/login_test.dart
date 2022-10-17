import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginTest extends StatelessWidget {
  const LoginTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS
        ? const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Koperasi Undiksha'),
            ),
            child: Center(
              child: SingleChildScrollView(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 33, 54, 243),
              title: const Text('Koperasi Undiksha'),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Image.asset(
                            'images/campus.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Container(
                          height: 300.0,
                          width: 350.0,
                          margin: const EdgeInsets.only(top: 30),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border(
                              top: BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 29, 59, 255)),
                              left: BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 29, 59, 255)),
                              right: BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 29, 59, 255)),
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 29, 59, 255)),
                            ),
                            color: Color(0xFFffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                                spreadRadius: 2.0,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                              )
                            ],
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30, top: 30),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Username'),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Password'),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 33, 54, 243),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()),
                                            );
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Buat Mbanking',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 33, 54, 243)),
                                            ),
                                            Text(
                                              'Lupa Password?',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 33, 54, 243)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
