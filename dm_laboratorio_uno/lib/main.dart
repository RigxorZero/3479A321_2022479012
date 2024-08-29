import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 9, 89, 126)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Prueba de Flutter V1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Función para incrementar el contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Función para disminuir el contador
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Función para reiniciar el contador
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/NoFace.svg",
              width: 150,
              semanticsLabel: 'Acme Logo'
            ),
            const Text(
              'Haz presionado el botón esta cantidad de veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: fa_btn(),
      bottomNavigationBar: btn_bar(),
    );
  }

  BottomAppBar btn_bar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: _decrementCounter, // Funcionalidad para restar
            icon: const Icon(Icons.remove_circle), // Icono de restar
          ),
          IconButton(
            onPressed: _incrementCounter, // Funcionalidad para sumar
            icon: const Icon(Icons.add_circle), // Icono de sumar
          ),
        ],
      ),
    );
  }

  FloatingActionButton fa_btn() {
    return FloatingActionButton(
      onPressed: _resetCounter, // Cambiamos la funcionalidad del botón flotante
      tooltip: 'Reset',
      child: const Icon(Icons.refresh), // Icono de reinicio
    );
  }
}
