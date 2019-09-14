import 'package:flutter/material.dart';
import 'package:flutter_pithackathon/countermodel.dart';
import 'package:flutter_pithackathon/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  var counterModel = CounterModel();
  runApp(ChangeNotifierProvider<CounterModel>(
      builder: (context) => counterModel, child: PitHackathonApp()));
}

class PitHackathonApp extends StatelessWidget {
  const PitHackathonApp({Key key}) : super(key: key);

  // Das ist das oberste Element Deiner Anwendung
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon Demo',
      theme: ThemeData(
        // Das ist das grundlegende Erscheinungsbild Deiner Anwendung.
        //
        // Starte die App mit "flutter run". Die App hat eine Blaue Leiste.
        // Ändere die Farbe unten in Colors.green lade die Anwendung mit neu
        // mit "hot reload" (drücke "r" in dem Fenster in dem Du "flutter run",
        // gestartet hast oder speichere einfach Android Studio (Steuerung+S).
        // Die Farbe ändert sich ohne dass die Anwendung neu gestartet wurde
        primarySwatch: Colors.blue,
      ),
      home: HackathonStartPage(
        title: 'Pit Hackathon Demo App'),
    );
  }
}

