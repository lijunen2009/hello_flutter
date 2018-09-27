import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  DetailStatus createState() => DetailStatus();
}

class DetailStatus extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Column(children: [
                new Icon(Icons.kitchen, color: Colors.green[500]),
                new Text('食材:'),
                new Text('30分钟'),
              ]),
              new Column(children: [
                new Icon(Icons.timer, color: Colors.green[500]),
                new Text('烹饪:'),
                new Text('5分钟'),
              ]),
              new Column(children: [
                new Icon(Icons.restaurant, color: Colors.green[500]),
                new Text('品尝:'),
                new Text('25分钟'),
              ]),
            ]));

    Widget header = new Container(
      padding: const EdgeInsets.all(10.0),
      child:
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Text('biao', style: new TextStyle(color: Colors.black,fontSize: 28.0)),
                new Text('sub title',style: new TextStyle(color:Colors.grey),)
              ]),
        ),
        new Icon(Icons.star),
        new Text('42')
      ]),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('this is detail'),
        ),
        body: new ListView(
          padding: const EdgeInsets.all(10.0),
          children: [titleSection, header]));
  }
}
