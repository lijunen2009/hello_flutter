import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexStatus createState() => new IndexStatus();
}

class IndexStatus extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: new Container(
          alignment: Alignment.center,
          // margin: const EdgeInsets.all(10.0),
          // padding: const EdgeInsets.all(10.0),
          // color: const Color(0xFF00FF00),
          child: new Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child:new Column(children: <Widget>[
            new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                padding: const EdgeInsets.all(10.0),
                color: Colors.blue,
                child:
                    new Text('主页', style: new TextStyle(color: Colors.white))),
            new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/detail');
                },
                color: Colors.blue,
                child:
                    new Text('来看看' ,style: new TextStyle(color: Colors.white))),
            new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                color: Colors.blue,
                child:
                    new Text('一个按钮', style: new TextStyle(color: Colors.white))),
          ]),
          )
        ));
  }
}
