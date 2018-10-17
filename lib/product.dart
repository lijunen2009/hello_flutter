import 'package:flutter/material.dart';
import 'package:hello_flutter/util/HttpUtil.dart';
class ProductPage extends StatefulWidget {
  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<ProductPage> {
  List stores = [];
  Future listStore() async {
    String url = 'store/listNearStore';
    var data = { 'lat': 40.865741, 'lng': 111.761752,'distance':50000};
    var response = await HttpUtil().post(url,data: data);
    if(response['status'] == 200){
      if(!mounted) return;
      setState(() {
          stores = response['data'];
        });
    }
    print(stores);
    
  }
  @override
  void initState(){
    super.initState();
    this.listStore();
  }


  final items = new List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text('产品列表')),
      body: new ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return new Divider();
          } else {
            return new ListTile(
              title: new Text('${stores[index]['name']}'),
              trailing: new Icon(Icons.gavel),
              onTap: (){}
            );
          }
        },
      ),
    );
  }
}
