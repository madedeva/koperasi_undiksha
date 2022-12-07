import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:praktikum_satu/components/home.dart';
import 'package:praktikum_satu/components/setting.dart';
import 'package:praktikum_satu/components/scan.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({Key? key}) : super(key: key);

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int currentIndex = 0;
  final List<Widget> body = [
    HomePage(),
    const Scan(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        onTap: ontap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: const Color.fromARGB(255, 33, 54, 243),
              ),
              label: 'Profile',
              activeIcon: FaIcon(
                FontAwesomeIcons.user,
                color: const Color.fromARGB(255, 33, 54, 243),
              )),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.qrcode,
                color: const Color.fromARGB(255, 33, 54, 243),
              ),
              label: 'QRIS',
              activeIcon: FaIcon(
                FontAwesomeIcons.qrcode,
                color: const Color.fromARGB(255, 33, 54, 243),
              )),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.gear,
                color: const Color.fromARGB(255, 33, 54, 243),
              ),
              label: 'Setting',
              activeIcon: FaIcon(
                FontAwesomeIcons.gear,
                color: const Color.fromARGB(255, 33, 54, 243),
              )),
        ],
      ),
    );
  }

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
