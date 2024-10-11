import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              "¡Hola! Soy Héctor Villalobos.\nEstudiante de Ingenieria en Desarrollo de Videojuegos y Realidad Virtual.",
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
