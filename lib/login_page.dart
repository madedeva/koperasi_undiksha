// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_satu/home_page.dart';
import 'package:praktikum_satu/main_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //no shading
        backgroundColor: const Color.fromARGB(255, 33, 54, 243), //appbar color
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
                            //form login
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 30),
                            child: Column(
                              children: [
                                const Text(
                                  'Username',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Username',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // labelText: 'Password',
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                          offset: Offset(
                                            2.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      color: const Color.fromARGB(
                                          255, 33, 54, 243),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.pushReplacement<void, void>(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (context) => const Home()),
                                      );
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.blue[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'copyright @2022 by Undiksha',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
