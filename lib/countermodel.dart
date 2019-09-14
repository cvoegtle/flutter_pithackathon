import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterModel extends ChangeNotifier {
  final String STORED_COUNTER = 'counter';
  int counter = 0;

  SharedPreferences preferences;

  CounterModel() {
    _setupDataStore();
  }

  incrementCounter() {
    _updateCounter(this.counter + 1);
  }

  decrementCounter() {
    _updateCounter(this.counter - 1);
  }

  void _setupDataStore() {
    SharedPreferences.getInstance().then((prefs) => _init(prefs));
  }

  _updateCounter(int newCounter) {
    this.counter = newCounter;
    _storeCounter();
    notifyListeners();
  }

  _init(SharedPreferences preferences) {
    this.preferences = preferences;
    var storedCounter = preferences.getInt(STORED_COUNTER);
    if (storedCounter != null) {
      _updateCounter(storedCounter);
    }
  }

  void _storeCounter() {
    this.preferences.setInt(STORED_COUNTER, this.counter);
  }
}
