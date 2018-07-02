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

  String _value = '';
  String _time = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019),
    );

    String value = "${picked.day} - ${picked.month} - ${picked.year}";

    if(picked != null) setState(() => _value = value);
  }

  Future _selectTime() async {
    TimeOfDay picked = await showTimePicker(
        context: context,
      initialTime: TimeOfDay.now()
    );

    String value = "${picked.format(context)}";

    if(picked != null) setState(() => _time = value);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(_value),
                SizedBox(height: 10.0,),
                new RaisedButton(onPressed: _selectDate,
                  child: new Text('Select Date'),),

                SizedBox(height: 20.0,),

                new Text(_time),
                SizedBox(height: 10.0,),
                new RaisedButton(onPressed: _selectTime,
                  child: new Text('Select Time'),),
              ],
            ),
          )
      ),
    );
  }
}