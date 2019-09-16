import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// das ist unser sehr einfaches Datenmodell, es enthält einen Counter.
/// 
/// Das Modell erweitert die Klasse 'ChangeNotifier' und informiert
/// die 'Consumer' des Modells über Änderungen durch den Aufruf von 
/// 'notifyListeners()' 
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

  // die SharedPreferences sind eine einfache Möglichkeit, um überschaubare
  // Daten dauerhaft zu speichern und später wieder abzurufen.
  //
  // Wir nutzen die SharedPreferences, um den Zählerstand zu speichern und
  // beim Start der App wieder abzurufen. So bleibt der Zählerstand erhalten
  // auch wenn ihr die App oder Euer Handy neu startet.
  //
  // Die SharedPreferences sind für einfach Daten gedacht. Ihr könnt aber auch
  // kompliziertere Dinge dort ablegen, wenn Ihr sie in einen JSON String 
  // umwandelt und beim Laden wieder zurück.
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
    // den Zähler aus den SharedPreferences lesen
    var storedCounter = preferences.getInt(STORED_COUNTER);
    if (storedCounter != null) {
      _updateCounter(storedCounter);
    }
  }

  void _storeCounter() {
    // Den Zähler speichern
    this.preferences.setInt(STORED_COUNTER, this.counter);
  }
}
