import 'package:flutter/material.dart';

class AuditScreen extends StatefulWidget {
  const AuditScreen({Key? key}) : super(key: key);

  @override
  _AuditScreenState createState() => _AuditScreenState();
}

class _AuditScreenState extends State<AuditScreen> {
  // Lista de historial de accesos
  final List<String> _accessHistory = [
    'Accedió a Pantalla Principal - 10:00 AM',
    'Accedió a Pantalla Detalle - 10:05 AM',
    'Accedió a Pantalla Sobre - 10:10 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría de Accesos'),
      ),
      body: ListView.builder(
        itemCount: _accessHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(_accessHistory[index]),
          );
        },
      ),
    );
  }
}
