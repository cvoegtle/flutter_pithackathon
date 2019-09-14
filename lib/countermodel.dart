
import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  CounterModel({int counter}) {
    this.counter = counter != null ? counter : 0;
  }

  incrementCounter() {
    this.counter++;
    notifyListeners();
  }
  
  decrementCounter() {
    this.counter--;
    notifyListeners();
  }
}