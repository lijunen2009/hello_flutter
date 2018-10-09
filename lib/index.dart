import 'package:flutter/material.dart';
import 'package:hello_flutter/component/bottom_bar.dart';
import 'package:hello_flutter/detail.dart';
import 'package:hello_flutter/home.dart';
import 'package:hello_flutter/wallet.dart';
import 'package:hello_flutter/shop.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexStatus createState() => new IndexStatus();
}

class IndexStatus extends State<IndexPage> {
  @override
  var _body = [];
  int _tabIndex = 0;
  Widget build(BuildContext context) {
    _body = [
      new RandomWords(),
      new DetailPage(),
      new WalletPage(),
      new ShopPage()
    ];
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _body[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.face), title: const Text('首页')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.favorite), title: const Text('看看')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.wallpaper), title: const Text('钱包')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.shop), title: const Text('商店')),
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
      ),
    );
  }
}
