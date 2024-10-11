import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/app_data.dart';

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
    // Accede a la instancia de AppData
    AppData appData = Provider.of<AppData>(context);

    // Añade la acción de acceso en un callback post frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appData.addAction("Accedió a Pantalla Detalle");
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hora de descansar", style: TextStyle(fontSize: 24)),
              Image.asset('assets/Images/peakpx.jpg', width: 400, height: 600),
              const SizedBox(height: 20),
              // Mostrar el contador proveniente del Provider
              Text(
                'Contador: ${appData.counter}', // Muestra el contador desde AppData
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: btn_bar(context),
    );
  }
}
