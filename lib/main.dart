import 'package:flutter/material.dart';
import 'package:hello_flutter/home.dart';
import 'package:hello_flutter/index.dart';
import 'package:hello_flutter/detail.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // initialRoute: '/',
      routes: {
        '/home': (BuildContext context) => new RandomWords(),
        '/detail': (BuildContext context) => new DetailPage(),
      },
      title: 'Welcome to Flutter',
      home: new IndexPage(),
      theme: new ThemeData(
          // 新增代码开始...
          primaryColor: Colors.lightGreenAccent),
    );
  }
}
