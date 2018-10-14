import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<ProductPage> {
  final items = new List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text('产品列表')),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return new Divider();
          } else {
            return new ListTile(
              title: new Text('${items[index]}'),
              trailing: new Icon(Icons.gavel),
              onTap: (){}
            );
          }
        },
      ),
    );
  }
}
