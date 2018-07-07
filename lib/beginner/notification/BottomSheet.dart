import 'package:flutter/material.dart';

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
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return new Container(
        height: 300.0,
        color: Colors.greenAccent,
        child: new Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlutterLogo(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Example of Bottom Sheet"),
              ),
              IconButton(icon: Icon(Icons.close),
                  onPressed: () => null)
            ],
          ),
        ),
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showPersBottomSheetCallBack = _showBottomSheet;
        });
      }
    });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.redAccent,
            child: new Center(
              child: new Text("Hi ModalSheet"),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bottom Sheet'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed: _showPersBottomSheetCallBack,
                  child: new Text("Persistent"),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                new RaisedButton(
                  onPressed: _showModalSheet,
                  child: new Text("Modal"),
                ),
              ],
            )),
      ),
    );
  }
}