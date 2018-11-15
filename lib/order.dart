import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/service/order.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

class OrderPage extends StatefulWidget {
  @override
  OrderStatus createState() => OrderStatus();
}

class OrderStatus extends State<OrderPage> {
  List orderList = [];
  int _itemCount = 0;
  int _currPage = 1;
  bool _isLoading = true;
  setStore() async {
    var orders = await listOrder(124, _currPage);
    setState(() {
      for (var item in orders['data']['list']) {
        orderList.add(item);
      }
      if (_currPage == 1) {
        _itemCount = orders['data']['list'].length;
      } else {
        _itemCount += orders['data']['list'].length;
      }
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setStore();
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        // _itemCount = _itemCount + orderList.length;
        _currPage++;
        setStore();
        print(_itemCount);
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        orderList = [];
        _itemCount = orderList.length;
        _currPage = 1;
        setStore();
      });
    });
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

  Widget _buildItem(index) {
    return new Column(
      children: <Widget>[
        buildOrderItem(orderList[index], index),
        new Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Divider()),
      ],
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return new Center(
          child: new CupertinoActivityIndicator(
        animating: true,
        radius: 30.0,
      ));
    } else {
      return new SafeArea(
          child: new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}) {
          return new Container(
              child: new ListView.builder(
            physics: physics,
            controller: controller,
            itemBuilder: (context, index) {
              // print(index);
              // print(orderList[index]);
              return new Column(
                children: <Widget>[
                  buildOrderItem(orderList[index], index),
                  new Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new Divider()),
                ],
              );
            },
            itemCount: _itemCount,
          ));
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Widget orderListWidget = new ListView.builder(
    //   itemCount: _itemCount,
    //   itemBuilder: (context, index) {
    //     return new Column(
    //       children: <Widget>[
    //         buildOrderItem(orderList[index], index),
    //         new Container(
    //             padding: EdgeInsets.only(left: 10.0, right: 10.0),
    //             child: new Divider()),
    //       ],
    //     );
    //   },
    // );
    // return  new Scaffold(
    //   appBar: new AppBar(title: new Text('订单列表')),
    //   body: orderListWidget,
    // );
    return new Scaffold(
        appBar: new AppBar(title: new Text('订单列表')), body: _buildBody());
  }
}
