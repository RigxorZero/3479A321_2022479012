import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer( // Drawer para el menú
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú Principal', style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.pushNamed(context, '/'); // Navega a la pantalla de inicio
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Detalle'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/detail'); // Navega a la pantalla Detalle
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about'); // Navega a la pantalla Sobre
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Auditoría'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/audit'); // Navega a la pantalla Auditoría
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenido a la pantalla principal'),
      ),
    );
  }
}
