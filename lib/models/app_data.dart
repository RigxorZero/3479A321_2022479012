import 'package:flutter/foundation.dart';

class AppData with ChangeNotifier {
  int _counter = 0;
  final List<String> _actions = [];

  int get counter => _counter;
  List<String> get actions => _actions;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void addAction(String action) {
    _actions.add(action);
    notifyListeners();
  }
}
