import 'package:flutter/material.dart';
import 'package:hello_flutter/home.dart';
import 'package:hello_flutter/index.dart';
import 'package:hello_flutter/detail.dart';
import 'package:hello_flutter/horizontal.dart';
import 'package:hello_flutter/product.dart';
import 'package:hello_flutter/grid.dart';
import 'package:hello_flutter/my_button.dart';
import 'package:hello_flutter/dismissible.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // initialRoute: '/',
      routes: {
        '/home': (BuildContext context) => new RandomWords(),
        '/detail': (BuildContext context) => new DetailPage(),
        '/index': (BuildContext context) => new IndexPage(),
        '/hor':(BuildContext context)=>new HorPage(),
        '/product':(BuildContext context)=>new ProductPage(),
        '/grid':(BuildContext context)=>new GridPage(),
        '/my_button':(BuildContext context)=>new ButtonPage(title: '终于可以传参数了',),
        '/dismissible':(BuildContext context)=>new DismissiblePage()
      },
      title: 'Welcome to Flutter',
      home: new IndexPage(),
      theme: new ThemeData(
        // 新增代码开始...
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
    );
  }
}
