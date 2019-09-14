import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pithackathon/countermodel.dart';
import 'package:flutter_pithackathon/decrementpage.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class HackathonStartPage extends StatelessWidget {
  HackathonStartPage({Key key, this.title}) : super(key: key);

  // Das ist die Startseite Deiner App. Sie ist stateful. Das heißt sie enthält
  // Informationen, die ihr Aussehen bestimmen.

  final String title;

  // Bei Zustandsänderungen wird die Build Methode aufgerufen und das gesamte
  // Widget neu aufgebaut

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
              Text('Du hast den Button so oft gedrückt:'),
              // Auf Veränderungen im Model reagieren und die Widgets neu aufbauen
              Consumer<CounterModel>(
                  builder: (context, counterModel, child) => Column(children: [
                        Text(
                          '${counterModel.counter}',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: calculatePadding(counterModel)),
                            child: RaisedButton.icon(
                              icon: Icon(Icons.arrow_upward),
                              label: Text("hochzählen"),
                              onPressed: _increment,
                            )),
                      ])),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HackathonDecrementPage(title: "Herunterzählen"))),
          tooltip: 'Zählrichtung ändern',
          child: Icon(Icons.threesixty),
        ) //
        );
  }
  
  double calculatePadding(CounterModel counterModel) => max(0.0, counterModel.counter.toDouble());
}
