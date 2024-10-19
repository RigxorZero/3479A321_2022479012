import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '/models/app_data.dart';

class AuditScreen extends StatefulWidget {
  const AuditScreen({super.key});

  @override
  _AuditScreenState createState() => _AuditScreenState();
}

class _AuditScreenState extends State<AuditScreen> {
  @override
  Widget build(BuildContext context) {
    // Accede a la instancia de AppData
    AppData appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría de Accesos'),
      ),
      body: ListView.builder(
        itemCount: appData.actions.length, // Usar la longitud de actions
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(appData.actions[index]), // Mostrar cada acción
            subtitle: Text('Acción ${index + 1} realizada.'), // Información adicional
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  appData.actions.removeAt(index); // Eliminar la acción
                });
              },
            ),
          );
        },
      ),
    );
  }
}
