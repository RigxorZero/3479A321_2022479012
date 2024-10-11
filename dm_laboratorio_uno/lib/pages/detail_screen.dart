import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  BottomAppBar btn_bar(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Regresa a la pantalla anterior
            },
            child: const Text("Volver"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            child: const Text("Sobre mí"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hora de descansar", style: TextStyle(fontSize: 24)),
            Image.asset('assets/Images/peakpx.jpg', width: 400, height: 600),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: btn_bar(context),
    );
  }
}
