import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //no shading
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 33, 54, 243), //appbar color
        title: const Text('Setting'),
      ),
      body: Container(
        child: Text('Setting'),
      ),
    );
  }
}
