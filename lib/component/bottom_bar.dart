import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  int _tabIndex;
  @override
  BottomState createState() => new BottomState();
}

class BottomState extends State <BottomBar>{
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: new Icon(Icons.face), title: const Text('首页')),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.favorite), title: const Text('看看')),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.email), title: const Text('钱包')),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.battery_std), title: const Text('商店')),
      ],
      //设置显示的模式
      type: BottomNavigationBarType.fixed,
      //设置当前的索引
      currentIndex: _tabIndex,
      //tabBottom的点击监听
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
        
      },
    );
  }
}
