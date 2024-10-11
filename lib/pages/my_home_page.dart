import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart'; // Asegúrate de importar Provider
import '/models/app_data.dart'; // Asegúrate de importar tu clase AppData

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    // Accede a la instancia de AppData usando context.watch para obtener el valor actualizado
    var appData = context.watch<AppData>();
    logger.i("Building MyHomePage widget");

    // Método que retorna el mensaje y el ícono basado en el valor del contador
    Widget _getMessageIcon() {
      if (appData.counter > 5) {
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
      } else if (appData.counter < -5) {
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
                Navigator.pushNamed(context, '/detail'); // Navega a la pantalla Detalle
              },
              child: const Text("Ir a Detalles"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
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
                  'Contador: ${appData.counter}', // Muestra el contador desde AppData
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20), // Espacio entre el contador y los botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<AppData>().decrementCounter(); // Llama al método de decremento
                      },
                      icon: const Icon(Icons.remove_circle, size: 40), // Icono de restar
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<AppData>().resetCounter(); // Llama al método de reinicio
                      },
                      icon: const Icon(Icons.refresh, size: 40), // Icono de reinicio
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<AppData>().incrementCounter(); // Llama al método de incremento
                      },
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
