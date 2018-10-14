import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final String title;
  ButtonPage({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Center(
          child: new MyButton(
        title: '我也是传过来的奥',
      )),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  MyButton({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(
            '这就是要显示的内容',
            style: TextStyle(color: Colors.limeAccent),
          ),
        ));
      },
      child:
          new Container(child: new Text(title), padding: EdgeInsets.all(10.0)),
    );
    // return new Text(title);
  }
}
