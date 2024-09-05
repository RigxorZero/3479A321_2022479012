import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'pages/my_home_page.dart';
import 'pages/detail_screen.dart';
import 'pages/about_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.i("Logger is working!");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Aurora',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 9, 89, 126)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Prueba de Flutter V1'),
      routes: {
        '/detail': (context) => const DetailScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
