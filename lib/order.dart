import 'package:flutter/material.dart';
import 'package:hello_flutter/service/order.dart';
import 'package:hello_flutter/util/HttpUtil.dart';

class OrderPage extends StatefulWidget {
  @override
  OrderStatus createState() => OrderStatus();
}

class OrderStatus extends State<OrderPage> {
  List orderList = [];

  // listStroe() async {
  //   String url = 'store/listNearStore';
  //   var data = {'lat': 40.865741, 'lng': 111.761752, 'distance': 50000};
  //   var response = await HttpUtil().post(url, data: data);
  //   print(response);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var o = listOrder(124);
    // var orders = getOrderById();
    // var list = listStroe();
    // print(list);
    // print(orders);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('订单列表')),
      body: new ListView(children: [new Text('HELLO ORDER')]),
    );
  }
}
