import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  ShopState createState() => ShopState();
}

class ShopState extends State {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      // color: Colors.yellow,
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: new Card(
              color: Colors.cyan,
              //阴影大小-默认2.0
              elevation: 5.0,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.access_time),
                    title: new Text('这是一个card'),
                    subtitle: const Text('这是个子标题'),
                  ),
                  new ButtonTheme.bar(
                    child: new ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new FlatButton(child: new Text('取消'), onPressed: () {}),
                        new FlatButton(child: new Text('确定'), onPressed: () {}),
                      ],
                    ),
                  )
                ],
              )),
        ),
        new SizedBox(
            // margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Card(
              color: Colors.amberAccent,
                child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.access_time),
                  title: new Text('这是一个card'),
                  subtitle: const Text('这是个子标题'),
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new FlatButton(child: new Text('取消'), onPressed: () {}),
                      new FlatButton(child: new Text('确定'), onPressed: () {}),
                    ],
                  ),
                )
              ],
            )))
      ],
    );
  }
}
