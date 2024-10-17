import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciaScreen extends StatefulWidget {
  const PreferenciaScreen({super.key});

  @override
  _PreferenciaScreenState createState() => _PreferenciaScreenState();
}

class _PreferenciaScreenState extends State<PreferenciaScreen> {
  String _username = '';
  double _counterValue = 0;

  // Método para cargar las preferencias desde SharedPreferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _counterValue = prefs.getDouble('counter') ?? 0;
    });
  }

  // Método para guardar las preferencias en SharedPreferences
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    await prefs.setDouble('counter', _counterValue);
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Cargar preferencias al iniciar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo para editar el nombre de usuario
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre de usuario'),
              initialValue: _username,
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Slider para el valor del contador
            Text('Valor del contador: ${_counterValue.toStringAsFixed(1)}'),
            Slider(
              min: 0,
              max: 100,
              divisions: 100,
              value: _counterValue,
              onChanged: (value) {
                setState(() {
                  _counterValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePreferences, // Guardar preferencias
              child: const Text('Guardar Preferencias'),
            ),
          ],
        ),
      ),
    );
  }
}
