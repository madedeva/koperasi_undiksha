import 'package:flutter/material.dart';
import 'package:praktikum_satu/components/beranda_scanner.dart';
import 'package:praktikum_satu/components/home_page.dart';
import 'package:praktikum_satu/components/register.dart';
import 'package:praktikum_satu/service/service.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, child!),
          maxWidth: 800,
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
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
      routes: {
        '/': (context) => const HomePage(title: 'Koperasi Undiksha'),
        '/register': (context) => RegisterPage(),
        '/beranda': (context) => const BerandaPage(title: 'Koperasi Undiksha'),
      },
      initialRoute: '/',
    );
  }

  getUsers() {
    Service _service = Service();
    _service.getDataUsers();
  }
}
