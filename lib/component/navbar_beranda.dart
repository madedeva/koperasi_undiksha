import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarBeranda extends StatefulWidget {
  const BottomBarBeranda({Key? key}) : super(key: key);

  @override
  State<BottomBarBeranda> createState() => _BottomBarBerandaState();
}

class _BottomBarBerandaState extends State<BottomBarBeranda> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  size: 34,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.userLarge,
                  size: 30,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
