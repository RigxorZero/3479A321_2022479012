import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart'; 
import '/models/app_data.dart'; 

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
    // Accede a la instancia de AppData
    AppData appData = Provider.of<AppData>(context);
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
                appData.addAction("Acceso a Pantalla Detalle"); // Registra la acción
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
                appData.addAction("Acceso a Pantalla Detalle"); // Registra la acción
                Navigator.pop(context);
                Navigator.pushNamed(context, '/detail'); // Navega a la pantalla Detalle
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Sobre'),
              onTap: () {
                appData.addAction("Acceso a Pantalla Sobre"); // Registra la acción
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about'); // Navega a la pantalla Sobre
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Auditoría'),
              onTap: () {
                appData.addAction("Acceso a Pantalla Auditoría"); // Registra la acción
                Navigator.pop(context);
                Navigator.pushNamed(context, '/audit'); // Navega a la pantalla Auditoría
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Preferencias'),
              onTap: () {
                appData.addAction("Acceso a Pantalla Preferencias"); // Registra la acción
                Navigator.pop(context);
                Navigator.pushNamed(context, '/preferences'); // Navega a la pantalla preferencias
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getMessageIcon(), 
                const SizedBox(height: 20), 
                Text(
                  'Contador: ${appData.counter}', 
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        appData.decrementCounter();
                      },
                      icon: const Icon(Icons.remove_circle, size: 40),
                    ),
                    IconButton(
                      onPressed: () {
                        appData.resetCounter();
                      },
                      icon: const Icon(Icons.refresh, size: 40), 
                    ),
                    IconButton(
                      onPressed: () {
                        appData.incrementCounter(); 
                      },
                      icon: const Icon(Icons.add_circle, size: 40), 
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
