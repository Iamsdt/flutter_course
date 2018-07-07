import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  void _alert(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert Dialog"),
            content: Text(text),
            actions: <Widget>[
              FlatButton(onPressed: ()=> Navigator.pop(context),
                  child: Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Add Widgets Here'),
            RaisedButton(
                child: Text("Click me"),
                onPressed: () => _alert("Example of Alert Dialoge"))
          ],
        ),
      ),
    );
  }
}
