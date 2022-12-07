import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_satu/components/app.dart';
import 'package:praktikum_satu/components/login.dart';
import 'package:praktikum_satu/components/nav_bottom.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    // return isIOS
    //     ? CupertinoApp(
    //         builder: (context, widget) => ResponsiveWrapper.builder(
    //           BouncingScrollWrapper.builder(context, widget!),
    //           maxWidth: 1200,
    //           minWidth: 450,
    //           defaultScale: true,
    //           breakpoints: const [
    //             ResponsiveBreakpoint.resize(450, name: MOBILE),
    //             ResponsiveBreakpoint.autoScale(600, name: TABLET),
    //           ],
    //         ),
    //         title: 'Koperasi Undiksha',
    //         debugShowCheckedModeBanner: false,
    //         theme: CupertinoThemeData(
    //           primaryContrastingColor: Colors.white,
    //         ),
    //         home: BottomBar(),
    //       )
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
        ],
      ),
      title: 'Koperasi Undiksha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryTextTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
