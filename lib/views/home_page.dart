import 'package:flutter/material.dart';
import 'package:praktikum_satu/views/bottom_bar.dart';
import 'package:praktikum_satu/views/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: const Center(
        child: LoginPage(),
      ),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
