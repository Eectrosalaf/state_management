import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterList extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}
