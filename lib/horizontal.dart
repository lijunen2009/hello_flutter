import 'package:flutter/material.dart';

class HorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // leading: new Icon(Icons.account_box),
        title: new Text('水平排列的listView'),
        actions: <Widget>[
          new Icon(Icons.dashboard),
        ],
      ),
      body: new ListView(
        // This next line does the trick.
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new Container(
            width: 160.0,
            height: 160.0,
            color: Colors.red,
          ),
          new Container(
            width: 160.0,
            height: 160.0,
            color: Colors.blue,
          ),
          new Container(
            width: 160.0,
            height: 160.0,
            color: Colors.green,
          ),
          new Container(
            width: 160.0,
            height: 160.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 160.0,
            height: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
