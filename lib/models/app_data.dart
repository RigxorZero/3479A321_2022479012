import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  // Contador
  int _counter = 0;

  // Lista de acciones
  List<String> _actions = [];

  // Getter para el contador
  int get counter => _counter;

  // Getter para la lista de acciones
  List<String> get actions => _actions;

  // Método para incrementar el contador
  void incrementCounter() {
    _counter++;
    _actions.add('Counter incremented to $_counter'); // Guardamos la acción
    notifyListeners(); // Notificamos a los oyentes sobre los cambios
  }

  // Método para resetear el contador
  void resetCounter() {
    _counter = 0;
    _actions.add('Counter reset to $_counter');
    notifyListeners();
  }
}
