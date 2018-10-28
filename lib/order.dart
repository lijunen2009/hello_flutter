import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/service/order.dart';


class OrderPage extends StatefulWidget {
  @override
  OrderStatus createState() => OrderStatus();
}

class OrderStatus extends State<OrderPage> {
  List orderList = [];

  setStore() async {
    
    var orders = await listOrder(124);
    print(orders);
    setState(() {
      orderList = orders['data']['list'];
    });
    print(orderList.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setStore();
  }

  Widget buildOrderItem(item, index) {
    var createTime =
        new DateTime.fromMillisecondsSinceEpoch(item['start_time'] * 1000);
    return new ListTile(
      title: new Text('${item['store_name']}'),
      subtitle: new Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: new Column(
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Container(
                      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: new Text("${item['order_code']}"),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: new Text('${item['id']}----${index}'),
                    )
                  ]),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Container(
                      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: new Text("${orderList[index]['order_code']}"),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: new Text(createTime.year.toString() +
                          '-' +
                          createTime.month.toString() +
                          '-' +
                          createTime.day.toString()),
                    )
                  ]),
            ],
          )),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget orderListWidget = new ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        return new Column(
          children: <Widget>[
            buildOrderItem(orderList[index], index),
            new Container(
              padding: EdgeInsets.only(left:10.0,right:10.0),
              child:new Divider()
            ),
        
          ],
        );
      },
    );

    return new Scaffold(
      appBar: new AppBar(title: new Text('订单列表')),
      body: orderListWidget,
    );
  }
}
