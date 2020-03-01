import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pithackathon/countermodel.dart';
import 'package:provider/provider.dart';

class HackathonDecrementPage extends StatelessWidget {
  HackathonDecrementPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    void _decrement() {
      // innerhalb eines BuildContext können wir uns das Model besorgen,
      // und es verändern, ohne etwas neu aufzubauen
      Provider.of<CounterModel>(context, listen: false).decrementCounter();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Du hast den Button so oft gedrückt:',
            ),
            // Auf Veränderungen im Model reagieren und die Widgets neu aufbauen
            Consumer<CounterModel>(
                builder: (context, counterModel, child) => Text(
                      '${counterModel.counter}',
                      style: Theme.of(context).textTheme.headline4,
                    )),
            RaisedButton.icon(
                onPressed: _decrement,
                icon: Icon(Icons.arrow_downward),
                label: Text("herunter zählen"))
          ],
        ),
      ),
    );
  }
}
