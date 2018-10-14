import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DismissiblePage extends StatelessWidget {
  final items = new List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('可删除的')),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return new Dismissible(
            key: new Key(item),
            background: new Container(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    '删除',
                    style: new TextStyle(color: Colors.white),
                  )
                ],
              ),
              color: Colors.red,
            ),
            child: new ListTile(title: new Text(items[index])),
            onDismissed: (dis) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismiss")));
            },
          );
        },
      ),
    );
  }
}
