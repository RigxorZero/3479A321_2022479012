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
  var logger = Logger();  // Instancia de Logger

  // Incrementar contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    logger.i("Counter incremented to $_counter");
  }

  // Disminuir contador
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    logger.i("Counter decremented to $_counter");
  }

  // Reiniciar contador
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    logger.i("Counter reset to $_counter");
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/TacoCat.svg",
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
            onPressed: _decrementCounter,
            icon: const Icon(Icons.remove_circle),
          ),
          IconButton(
            onPressed: _incrementCounter,
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }

  FloatingActionButton fa_btn() {
    return FloatingActionButton(
      onPressed: _resetCounter,
      tooltip: 'Reset',
      child: const Icon(Icons.refresh),
    );
  }
}
