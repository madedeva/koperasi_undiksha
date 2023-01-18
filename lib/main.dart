import 'package:flutter/material.dart';
import 'package:praktikum_satu/menu/register.dart';
import 'package:praktikum_satu/menu/setoran.dart';
import 'package:praktikum_satu/menu/tarik.dart';
import 'package:praktikum_satu/menu/transfer.dart';
import 'package:praktikum_satu/services/services.dart';
import 'package:praktikum_satu/app.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(600, name: 'Midle'),
            ResponsiveBreakpoint.resize(700, name: 'MidleLarge'),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScaleDown(900, name: 'LargeTablet'),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      title: 'Koperasi Undiksha',
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
      home: ChangeNotifierProvider(
        create: (context) => UserServices(),
        child: Main(),
      ),
      routes: {
        '/login': (context) => Main(),
        '/register': (context) => Register(),
        '/setor': (context) => Setoran(),
        '/tarik': (context) => Tarikan(),
        '/transfer': (context) => Transfer(),
      },
    );
  }
}
