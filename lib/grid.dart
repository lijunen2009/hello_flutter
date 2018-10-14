import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  @override
  GridStatus createState() => GridStatus();
}

class GridStatus extends State {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('grid')),
      body: new GridView.count(
        crossAxisCount: 4,
        // padding: EdgeInsets.all(20.0),
        children: new List.generate(100, (index) {
          return new Center(
            child: new Container(
                color: Colors.orange,
                padding: EdgeInsets.all(20.0),
                child: new Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                )),
          );
        }),
      ),
    );
  }
}
