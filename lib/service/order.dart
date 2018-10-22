import 'package:hello_flutter/util/HttpUtil.dart';

Future listOrder(int userId) async {
  String url = 'order/listOrder';
  var data = {'curr_page': 1, 'page_number': 15, 'status': 0, 'user_id': userId};
  var response = await HttpUtil().post(url, data: data);
  print(response);
  return response;
}

Future listStroe() async {
  String url = 'store/listNearStore';
  var data = {'lat': 40.865741, 'lng': 111.761752, 'distance': 50000};
  var response = await HttpUtil().post(url, data: data);
  print(response);
}

getOrderById() async {
  String url = 'order/getOrderById';
  var data = {'order_id': 306};
  var response = await HttpUtil().post(url, data: data);
  print(response);
}
