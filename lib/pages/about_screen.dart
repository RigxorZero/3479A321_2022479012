import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/app_data.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool _hasLoggedAction = false; // Flag para controlar el registro de acciones

  @override
  Widget build(BuildContext context) {
    // Accede a la instancia de AppData
    AppData appData = Provider.of<AppData>(context);

    // Añade la acción de acceso en un callback post frame solo si no se ha registrado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasLoggedAction) {
        appData.addAction("Accedió a Pantalla Sobre");
        _hasLoggedAction = true;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre mí"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sobre el Desarrollador",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              "¡Hola! Soy Héctor Villalobos.\nEstudiante de Ingeniería en Desarrollo de Videojuegos y Realidad Virtual.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Regresar"),
            ),
          ],
        ),
      ),
    );
  }
}
