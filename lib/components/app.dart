import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_satu/components/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.gear),
                  label: 'Setting',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.qrcode),
                  label: 'QRIS',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'Profile',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              late final CupertinoTabView returnValue;
              switch (index) {
                case 0:
                  returnValue = CupertinoTabView(builder: (context) {
                    return CupertinoPageScaffold(
                      child: Text('Setting'),
                    );
                  });
                  break;
                case 1:
                  returnValue = CupertinoTabView(builder: (context) {
                    return CupertinoPageScaffold(
                      child: Text('QRIS'),
                    );
                  });
                  break;
                case 2:
                  returnValue = CupertinoTabView(builder: (context) {
                    return CupertinoPageScaffold(
                      child: HomePage(),
                    );
                  });
                  break;
              }
              return returnValue;
            },
          )
        : BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 33, 54, 243),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code,
                ),
                label: 'QRIS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
            showUnselectedLabels: true,
          );
  }
}
