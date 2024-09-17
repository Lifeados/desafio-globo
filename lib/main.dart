import 'package:desafio_globo/ui/module/home/home_page.dart';
import 'package:desafio_globo/ui/module/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GloboApp());
}

class GloboApp extends StatefulWidget {
  const GloboApp({super.key});

  @override
  State<GloboApp> createState() => _GloboAppState();
}

class _GloboAppState extends State<GloboApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashPage',
      routes: {
        '/splashPage': (context) => const SplashPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
