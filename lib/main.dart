import 'package:flutter/material.dart';
import 'package:flutter_pithackathon/countermodel.dart';
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
      home: MyHackathonPage(
        title: 'Pit Hackathon Flutter Demo'),
    );
  }
}

class MyHackathonPage extends StatelessWidget {
  MyHackathonPage({Key key, this.title}) : super(key: key);

  // Das ist die Startseite Deiner App. Sie ist stateful. Das heißt sie enthält
  // Informationen, die ihr Aussehen bestimmen.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    
    void _increment() {
      // innerhalb eines BuildContext können wir uns das Model besorgen,
      // und es verändern, ohne etwas neu aufzubauen
      Provider.of<CounterModel>(context, listen: false).incrementCounter();
    }


    // Diese Methode wird immer ausgeführt, wenn sich der State (Zustand) ändert,
    // z.B. durch _incrementCounter oben.
    //
    // Flutter ist darauf optimiert die build() Methode sehr schnell auszuführen,
    // daher ist es möglich immer alles neu zu bauen, statt die Widgets zu
    // verändern.
    return Scaffold(
      appBar: AppBar(
        // Den Wert aus MyHackathonPage als Titel anzeigen
        title: Text(title),
      ),
      body: Center(
        // Center ist ein Layout Widget. Es enthält genau ein Widget und positioniert
        // es in der Mitte.
        child: Column(
          // Column ist auch ein Layout Widget. Es enthält eine  List von Widgets
          // ("Kinder") und ordnet sie vertikal an. Als Voreinstellung, bekommen die "Kinder"
          // die Breite der Column. Die Column selbst ist so hoch wie ihr "Elternteil".
          //
          // Mit "debug painting" (drücke "p" in der Konsole, wähle
          // "Toggle Debug Paint" im Flutter Inspector in Android
          // Studio, oder "Toggle Debug Paint" command in Visual Studio Code)
          // um die Umrisse der Widgets zu sehen.
          //
          // Column besitzt mehrere Properties, um zu steuern welchen Raum es einnimmt
          // und wie es seine Kinder positioniert. Hier werden die Kinder über
          // mainAxisAlignment vertikal zentriert; Die vertikale Achse ist die
          // Hauptachse, den Columns (Spalten) sind vertikal (Die cross axis wäre
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Du hast den Button so oft gedrückt:',
            ),
            // Auf Veränderungen im Model reagieren und die Widgets neu aufbauen
            Consumer<CounterModel>(
                builder: (context, counterModel, child) => Text(
                      '${counterModel.counter}',
                      style: Theme.of(context).textTheme.display1,
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Hochzählen',
        child: Icon(Icons.add),
      ), // Das Komma am Ende dient einer schöneren Formatierung der Build Methode.
    );
    
  }
}
