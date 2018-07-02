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

  String value = "Hello";

  _click(String value){
    setState(() {
      this.value = value;
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
            new Text(value),
            SizedBox(height: 10.0,),
            FlatButton(onPressed:_click("Hello I am shudipto"),
              child: Text("Click me"),),

            IconButton(icon:Icon(Icons.add),
                onPressed:_click("Hello I am shudipto")),
          ],
        ),
      ),
    );
  }
}