import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var logger = Logger();

  // Función para incrementar el contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    logger.i("Counter incremented to $_counter");
  }

  // Función para disminuir el contador
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    logger.i("Counter decremented to $_counter");
  }

  // Función para reiniciar el contador
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    logger.i("Counter reset to $_counter");
  }

  // Método que retorna el mensaje y el ícono basado en el valor del contador
  Widget _getMessageIcon() {
    if (_counter > 5) {
      return Column(
        children: [
          SvgPicture.asset(
            'assets/icons/finn.svg',
            width: 100,
            height: 100,
          ),
          const Text("¡Victoria!", style: TextStyle(fontSize: 24, color: Colors.green)),
        ],
      );
    } else if (_counter < -5) {
      return Column(
        children: [
          SvgPicture.asset(
            'assets/icons/ghost.svg',
            width: 100,
            height: 100,
          ),
          const Text("Derrota", style: TextStyle(fontSize: 24, color: Colors.red)),
        ],
      );
    } else {
      return Column(
        children: [
          SvgPicture.asset(
            'assets/icons/sword.svg',
            width: 100,
            height: 100,
          ),
          const Text("Jugando", style: TextStyle(fontSize: 24, color: Colors.blue)),
        ],
      );
    }
  }

  BottomAppBar btn_bar() {
    return BottomAppBar(
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: const Text("Ir a Detalles"),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    logger.i("Building MyHomePage widget");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          elevation: 5, // Sombra para la tarjeta
          margin: const EdgeInsets.all(16), // Espaciado alrededor de la tarjeta
          child: Padding(
            padding: const EdgeInsets.all(16), // Espaciado interno
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getMessageIcon(), // Mostrar icono y mensaje
                const SizedBox(height: 20), // Espacio entre el mensaje y el contador
                Text(
                  'Contador: $_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20), // Espacio entre el contador y los botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _decrementCounter, // Funcionalidad para restar
                      icon: const Icon(Icons.remove_circle, size: 40), // Icono de restar
                    ),
                    IconButton(
                      onPressed: _resetCounter, // Funcionalidad para reiniciar
                      icon: const Icon(Icons.refresh, size: 40), // Icono de reinicio
                    ),
                    IconButton(
                      onPressed: _incrementCounter, // Funcionalidad para sumar
                      icon: const Icon(Icons.add_circle, size: 40), // Icono de sumar
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: btn_bar(),
    );
  }
}
