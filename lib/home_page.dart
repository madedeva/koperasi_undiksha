import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      ),
      body: Center(),
    );
  }
}
