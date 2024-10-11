import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'pages/my_home_page.dart';
import 'pages/detail_screen.dart';
import 'pages/about_screen.dart';
import 'pages/audit_screen.dart';
import 'models/app_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: const MyApp(),
    ),
  );
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
      home: const MyHomePage(title: 'Pantalla Principal'),
      routes: {
        '/detail': (context) => const DetailScreen(),
        '/about': (context) => const AboutScreen(),
        '/audit': (context) => const AuditScreen(),
      },
    );
  }
}
