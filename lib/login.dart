import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        backgroundColor: const Color.fromARGB(255, 33, 54, 243),
        elevation: 0,
      ),
      body: Center(
        child: isIOS
            ? SingleChildScrollView(
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
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: 400.0,
                          height: 300.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFffffff),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: const CupertinoTextField(
                                    placeholder: 'Username',
                                    padding: EdgeInsets.all(20.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: const CupertinoTextField(
                                    placeholder: 'Password',
                                    padding: EdgeInsets.all(20.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: CupertinoButton(
                                    color:
                                        const Color.fromARGB(255, 33, 54, 243),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 20.0, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Buat Mbanking',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 33, 54, 243)),
                                      ),
                                      Text(
                                        'Lupa Password?',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 33, 54, 243)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
              )
            : SingleChildScrollView(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                                                        const HomePage()),
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
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
