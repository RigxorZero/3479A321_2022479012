import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/DatabaseHelper.dart';
import '../models/auditoria.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var logger = Logger();
  String _username = ''; // Variable para almacenar el nombre de usuario
  double _counterValue = 0; // Variable para almacenar el valor del contador

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Cargar las preferencias al iniciar la pantalla
    _registrarAccion("Acceso a Pantalla Principal");
  }

  // Método para cargar las preferencias desde SharedPreferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? ''; // Cargar nombre de usuario
      _counterValue = prefs.getDouble('counter') ?? 0; // Cargar el contador
    });
  }

  // Método para registrar una acción en la base de datos
  Future<void> _registrarAccion(String accion) async {
    Auditoria auditoria = Auditoria(id: DateTime.now().millisecondsSinceEpoch, accion: accion);
    await DatabaseHelper.insertarAccion(auditoria);
    logger.i("Acción registrada: $accion");
  }

  // Método que retorna el mensaje y el ícono basado en el valor del contador
  Widget _getMessageIcon() {
    if (_counterValue > 5) {
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
    } else if (_counterValue < -5) {
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
              _registrarAccion("Ir a Pantalla Detalle"); // Registrar acción de navegar
              Navigator.pushNamed(context, '/detail'); // Navega a la pantalla Detalle
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
                _registrarAccion("Acceso a Pantalla Inicio"); // Registrar acción de acceder a inicio
                Navigator.pop(context); // Cierra el Drawer
                Navigator.pushNamed(context, '/'); // Navega a la pantalla de inicio
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Detalle'),
              onTap: () {
                _registrarAccion("Acceso a Pantalla Detalle"); // Registrar acción de acceder a detalle
                Navigator.pop(context);
                Navigator.pushNamed(context, '/detail'); // Navega a la pantalla Detalle
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Sobre'),
              onTap: () {
                _registrarAccion("Acceso a Pantalla Sobre"); // Registrar acción de acceder a sobre
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about'); // Navega a la pantalla Sobre
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Auditoría'),
              onTap: () {
                _registrarAccion("Acceso a Pantalla Auditoría"); // Registrar acción de acceder a auditoría
                Navigator.pop(context);
                Navigator.pushNamed(context, '/audit'); // Navega a la pantalla Auditoría
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Preferencias'),
              onTap: () {
                _registrarAccion("Acceso a Pantalla Preferencias"); // Registrar acción de acceder a preferencias
                Navigator.pop(context);
                Navigator.pushNamed(context, '/preferences').then((_) {
                  _loadPreferences(); // Vuelve a cargar las preferencias cuando regrese de la pantalla de preferencias
                });
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
                // Mostrar mensaje de bienvenida si el nombre de usuario está definido
                if (_username.isNotEmpty)
                  Text('Hola $_username', style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                _getMessageIcon(), // Icono que cambia según el valor del contador
                const SizedBox(height: 20),
                Text(
                  'Contador: ${_counterValue.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _counterValue--; // Disminuir el contador
                        });
                        _registrarAccion("Contador disminuido"); // Registrar acción
                      },
                      icon: const Icon(Icons.remove_circle, size: 40),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _counterValue = 0; // Reiniciar el contador
                        });
                        _registrarAccion("Contador reiniciado"); // Registrar acción
                      },
                      icon: const Icon(Icons.refresh, size: 40),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _counterValue++; // Aumentar el contador
                        });
                        _registrarAccion("Contador aumentado"); // Registrar acción
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
