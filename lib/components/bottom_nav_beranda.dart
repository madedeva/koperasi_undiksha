import 'package:flutter/material.dart';
import 'package:praktikum_satu/components/list_user_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarWidgetBeranda extends StatefulWidget {
  const BottomBarWidgetBeranda({Key? key}) : super(key: key);

  @override
  State<BottomBarWidgetBeranda> createState() => _BottomBarWidgetBerandaState();
}

class _BottomBarWidgetBerandaState extends State<BottomBarWidgetBeranda> {
  @override
  Widget build(BuildContext context) {
    // target platform
    bool isiOS = Theme.of(context).platform == TargetPlatform.iOS;
    return BottomAppBar(
      color: Colors.grey.shade200,
      shape: const CircularNotchedRectangle(),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  size: 34,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListUserPage()));
                },
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
