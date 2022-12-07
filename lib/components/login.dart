import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_satu/components/nav_bottom.dart';
import 'package:praktikum_satu/components/service/service.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service _service = Service();

  @override
  Widget build(BuildContext context) {
    // bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    // return isIOS
    //     ? CupertinoPageScaffold(
    //         navigationBar: CupertinoNavigationBar(
    //           middle: Text('Koperasi Undiksha'),
    //         ),
    //         child: Center(
    //           child: SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 Image(
    //                   image: AssetImage(
    //                     'images/campus.png',
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 50.0,
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.all(10.0),
    //                   height: 80,
    //                   child: const CupertinoTextField(
    //                     placeholder: 'Username',
    //                     style: TextStyle(fontSize: 20.0),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.all(10.0),
    //                   height: 80,
    //                   child: const CupertinoTextField(
    //                     placeholder: 'Password',
    //                     style: TextStyle(fontSize: 20.0),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 10.0,
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: CupertinoButton.filled(
    //                     child: const Text('Login',
    //                         style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 20.0,
    //                             fontWeight: FontWeight.bold)),
    //                     onPressed: () {
    //                       Navigator.pushReplacement<void, void>(
    //                         context,
    //                         MaterialPageRoute<void>(
    //                             builder: (context) => const HomePage()),
    //                       );
    //                     },
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       TextButton(
    //                           onPressed: () {
    //                             print('Buat Mbanking');
    //                           },
    //                           child: Text(
    //                             'Buat Mbanking',
    //                             style: TextStyle(color: Colors.blue),
    //                           )),
    //                       TextButton(
    //                           onPressed: () {
    //                             print('Lupa Password');
    //                           },
    //                           child: Text(
    //                             'Lupa Password?',
    //                             style: TextStyle(color: Colors.blue),
    //                           )),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       )
    return Scaffold(
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.0,
                        color: const Color.fromARGB(255, 29, 59, 255),
                      ),
                      color: const Color(0xFFffffff),
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
                                TextField(
                                  controller: usernameController,
                                  decoration:
                                      InputDecoration(labelText: 'Username'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: passwordController,
                                  decoration:
                                      InputDecoration(labelText: 'Password'),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    var status = await _service.postLogin(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                    if (status!.contains('success')) {
                                      Navigator.pushReplacement<void, void>(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (context) =>
                                                const HomePage()),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 12.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      primary:
                                          Color.fromARGB(255, 29, 59, 255)),
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
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
                                        child: const Text('Lupa Password?',
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  // postLogin(String username, String password) async {

  //   await _service.postLogin(username, password);
  // }
}
