import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Koperasi Undiksha'),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'images/campus.png',
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 80,
                      child: const CupertinoTextField(
                        placeholder: 'Username',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 80,
                      child: const CupertinoTextField(
                        placeholder: 'Password',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: CupertinoButton.filled(
                        child: const Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                print('Buat Mbanking');
                              },
                              child: Text(
                                'Buat Mbanking',
                                style: TextStyle(color: Colors.blue),
                              )),
                          TextButton(
                              onPressed: () {
                                print('Lupa Password');
                              },
                              child: Text(
                                'Lupa Password?',
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
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
                          height: 350.0,
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
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     blurRadius: 15.0,
                            //     spreadRadius: 2.0,
                            //     offset: Offset(
                            //       5.0,
                            //       5.0,
                            //     ),
                            //   )
                            // ],
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
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
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Buat Mbanking',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 33, 54, 243)),
                                              )),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                  'Lupa Password?',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 29, 59, 255)))),
                                        ],
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
            bottomNavigationBar: BottomAppBar(
              child: Container(
                height: 50,
                color: const Color.fromARGB(255, 33, 54, 243),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CopyRight 2022 by Koperasi Undiksha',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
