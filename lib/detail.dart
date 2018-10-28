import 'package:flutter/material.dart';
import 'package:hello_flutter/component/bottom_bar.dart';
import 'package:hello_flutter/util/HttpUtil.dart';
import 'dart:convert';
import 'package:hello_flutter/model/user.dart';

class DetailPage extends StatefulWidget {
  @override
  DetailStatus createState() => DetailStatus();
}

class DetailStatus extends State<DetailPage> {
  List stores =[];
  Future getData() async {
    String url = 'test/test3';
    var data = {'store_id': 45, 'lat': 40.23, 'lng': 111.234};
    var response = await HttpUtil().post(url, data: data);
    print(response);
    print(response['data']);
    // Map userMap = json.decode(response['data']);
    var user = new User.fromJson(response['data']);
    print(user.name);
    print(user.phone);
  }

  Future listStore() async {
    String url = 'store/listNearStore';
    var data = { 'lat': 40.865741, 'lng': 111.761752,'distance':50000};
    var response = await HttpUtil().post(url,data: data);
    if(response['status'] == 200){
      setState(() {
          stores = response['data'];
        });
    }
    print(stores);
    print(response);
  }
  @override
  void initState(){
    super.initState();
    // getData();
    // listStore();

  }

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
                new Text('biao',
                    style: new TextStyle(color: Colors.black, fontSize: 28.0)),
                new Text(
                  'sub title',
                  style: new TextStyle(color: Colors.grey),
                )
              ]),
        ),
        new Icon(Icons.star),
        new Text('42')
      ]),
    );
    Widget imageContaner = new Container(
        child: new Image.asset(
      'img/a.jpg',
      fit: BoxFit.fill,
    ));
    Widget imageContaner1 = new Container(
        child: new Image.asset(
      'img/1.jpg',
      fit: BoxFit.fill,
    ));
    Widget imageContaner2 = new Container(
        child: new Image.asset(
      'img/2.jpg',
      fit: BoxFit.fill,
    ));
    Widget text = new Container(
      child: new Text(
        '这是要侠士的内容这是要侠士的内容这是要侠士的内容这是要侠士的内容这是要侠士的内容这是要侠士的内容这是要侠士的内容',
        textAlign: TextAlign.start,
        style: new TextStyle(
            fontStyle: FontStyle.normal, fontSize: 23.0, color: Colors.grey),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
    Widget button = new RaisedButton(
      child: new Text('这是个buttont'),
      color: Color.fromRGBO(255, 87, 34, 1.0),
      textColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamed('/hor');
      },
    );
    Widget button2 = new RaisedButton(
      child: new Text('产品列表'),
      color: Color.fromRGBO(255, 87, 34, 1.0),
      textColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamed('/product');
      },
    );
    Widget button3 = new RaisedButton(
      child: new Text('去看看grid'),
      color: Color.fromRGBO(139, 195, 74, 1.0),
      textColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamed('/grid');
      },
    );
    Widget customerButton = RaisedButton(
      child: new Text('自定义button'),
      color: Color.fromRGBO(156, 39, 176, 1.0),
      textColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamed('/my_button');
      },
    );
    Widget customerButton2 = RaisedButton(
      child: new Text('自定义button2'),
      color: Color.fromRGBO(156, 39, 176, 1.0),
      textColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamed('/dismissible');
      },
    );
    Widget orderButton = RaisedButton(
      child: new Text('订单列表'),
      color: Color.fromRGBO(156, 39, 176, 1.0),
      textColor: Color.fromRGBO(255, 255, 255, 1.0),
      onPressed: (){
        Navigator.of(context).pushNamed('/order');
      },
    );
    return new Container(
      child: new ListView(padding: const EdgeInsets.all(10.0), children: [
        imageContaner,
        imageContaner1,
        imageContaner2,
        titleSection,
        header,
        text,
        button,
        button2,
        button3,
        customerButton,
        customerButton2,
        orderButton
      ]),
    );
  }
}
