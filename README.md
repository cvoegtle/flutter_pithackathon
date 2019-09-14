# flutter_pithackathon

Dies ist eine kleine Demo-App, die Euch den Einstieg in Flutter erleichtern soll.
 
Die App hat zwei Seiten, damit Ihr sehen könnt wie man zwischen Seiten navigiert. Die App zeigt Euch das 
Zusammenspiel zwischen Daten (State) und der Oberfläche (Widgets).
 
Als letztes könnt ihr in der App sehen , wie man Daten speichern kann, so dass sie beim nächsten Start der App 
wieder da sind. 

## State Management
Flutter unterscheidet zwischen dem Zustand (State) der Anwendung und der Darstellung des Zustands. Der State wird im 
Modell gespeichert und dargestellt wird der Zustand in den Widgets. Sollte sich der Zustand ändern, dann werden die 
Widgets einfach neu gemacht.

Ein relativ einfaches State-Management-Verfahren ist die Bibliothek 
[provider](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#accessing-the-state). Die kennt 
drei Komponenten


* `ChangeNotifier`, das ist das Modell, das den Zustand verwaltet und über Änderungen informiert. In der App ist das 
die Klasse `CounterModel`
* `ChangeNotifierProvider`, diese Klasse kennt das Modell und die Widgets, die das Modell anzeigen. In der App findet 
Ihr ihn in main.dart `runApp(ChangeNotifierProvider<CounterModel>(
                            builder: (context) => counterModel, child: PitHackathonApp()));` 
* die `Consumer` befinden sich in `PitHackathonApp()` und sind für die Darstellung verantwortlich, z.B. in 
start_paget.dart `Consumer<CounterModel>(builder: (context, counterModel, child) =>...`
                                  
Möchte man auf das Modell zugreifen um es zu verändern, z.B. nach einem Klick auf einen Button, dann geht das wie folgt: 
`Provider.of<CounterModel>(context, listen: false).incrementCounter();`
  

## Navigation

Eine Seite ist ein [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html). 
Um die Seite zu wechseln nutzt man den [Navigator](https://flutter.dev/docs/development/ui/navigation)

Das sieht z.B. so aus: 

`Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) =>
                       HackathonDecrementPage(title: "Herunterzählen")))` 

## Daten speichern
Am einfachsten kann man Daten als Key-Value-Paare speichern. D.h. man gibt einen Namen (Key) an und speichert darunter 
seine Daten. Mit dem Key kann man die Daten später wieder abrufen.

Das Beispiel dafür findet ihr in countermodel.dart

`  void _setupDataStore() {
     SharedPreferences.getInstance().then((prefs) => _init(prefs));
   } 
`

`  void _storeCounter() {
     this.preferences.setInt(STORED_COUNTER, this.counter);
   }
`

## ein letzter Tipp: pubspec.yaml
immer wenn ihr eine Bibliothek verwendet, müsst ihr sie in der pubspec.yaml eintragen, um sie zum importieren. In 
unserem Beispiel sind das

`  provider: ^3.1.0
   shared_preferences: ^0.5.3
`

aber Eure Liste wird bestimmt viel länger :-)

## Los gehts

This project is a starting point for a Flutter application.

Mehr Infos zu Flutter findet Ihr bei [flutter.dev](https://flutter.dev/docs):

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
