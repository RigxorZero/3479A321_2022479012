import 'package:flutter/material.dart';
import '/models/app_data.dart';
import '../utils/DatabaseHelper.dart'; // Asegúrate de importar DatabaseHelper
import '../models/auditoria.dart'; // Asegúrate de importar Auditoria

class AuditScreen extends StatefulWidget {
  const AuditScreen({super.key});

  @override
  _AuditScreenState createState() => _AuditScreenState();
}

class _AuditScreenState extends State<AuditScreen> {
  List<Auditoria> _actions = [];

  @override
  void initState() {
    super.initState();
    _loadActions(); // Cargar acciones al iniciar la pantalla
  }

  Future<void> _loadActions() async {
    _actions = await DatabaseHelper.obtenerAcciones();
    setState(() {}); // Actualiza la UI después de cargar las acciones
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría de Accesos'),
      ),
      body: ListView.builder(
        itemCount: _actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(_actions[index].accion), // Mostrar cada acción
            subtitle: Text('Acción ${index + 1} realizada.'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _actions.removeAt(index); // Eliminar de la UI (puedes agregar lógica para eliminar de la DB si lo deseas)
                });
              },
            ),
          );
        },
      ),
    );
  }
}
